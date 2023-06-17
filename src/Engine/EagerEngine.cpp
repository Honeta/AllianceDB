/*
 * Copyright 2022 IntelliStream team (https://github.com/intellistream)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "Engine/EagerEngine.hpp"

#include <memory>
#include <thread>

#include "Join/HandshakeJoin.hpp"
#include "Join/HashJoin.hpp"
#include "Join/SplitJoin.hpp"
#include "Join/SplitJoinOrigin.hpp"
#include "Utils/Logger.hpp"

using namespace std;
using namespace AllianceDB;

EagerEngine::EagerEngine(const Param &param) : param(param) {}

JoinerPtr EagerEngine::NewJoiner() {
  switch (param.algo) {
    case AlgoType::HandshakeJoin: {
      return make_shared<HandshakeJoin>(param, windows.size());
    }
    case AlgoType::SplitJoin: {
      return make_shared<SplitJoin>(param, windows.size());
    }
    case AlgoType::SplitJoinOrigin: {
      return make_shared<SplitJoinOrigin>(param, windows.size());
    }
    default: {
      FATAL("Unsupported algorithm %d", param.algo);
    }
  }
}

void EagerEngine::Run(Context &ctx) {
  auto sr = ctx.streamR, ss = ctx.streamS;
  while (sr->HasNext() && ss->HasNext()) {//read the next tuple from either stream R or stream S.
    auto nextS = ss->Next(), nextR = sr->Next();
    if (param.algo == AlgoType::SplitJoinOrigin) {//there is only one engine in the traditional approach.
      if (nextR->ts == 0) {
        windows.push_back(NewJoiner());
        windows[0]->Start(ctx);
      }
      windows[0]->Feed(nextR);
      windows[0]->Feed(nextS);
    } else {
      if (nextR->ts % param.sliding_size == 0
          && windows.size() < param.num_windows) {//for each window, we can create a separate engine.
        windows.push_back(NewJoiner());
        windows.back()->Start(ctx);
        DEBUG("algo[%d/%d] started", windows.size() - 1, windows.size());
      }
      int idx;
      if (nextR->ts < param.window_length) {
        idx = 0;
      } else {
        idx = (nextR->ts - param.window_length) / param.sliding_size + 1;
      }
      for (; idx < windows.size(); idx++) {
        windows[idx]->Feed(nextR);
        windows[idx]->Feed(nextS);
      }
    }
  }
  for (int i = 0; i < windows.size(); ++i) {
    windows[i]->Wait();
    DEBUG("algo[%d/%d] joined", i, windows.size());
  }
}
