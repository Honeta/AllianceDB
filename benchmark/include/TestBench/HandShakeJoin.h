//
// Created by Wang Chenyu on 15/12/21.
//

#ifndef HYBRID_JOIN_HANDSHAKEJOIN_H
#define HYBRID_JOIN_HANDSHAKEJOIN_H

#include <Common/Types.hpp>
#include <TestBench/AbstractJoinMethod.h>
#include <WindowSlider/HandShakeWS.h>
namespace AllianceDB {
class HandShakeJoin : public AbstractJoinMethod<HandShakeWS> {
 public:
  static void execute(Result &joinResult, RelationCouple &relationCouple);
  static void threadWork(int id, numberType windowSize);
  // static void test(Result &joinResult, RelationCouple &relationCouple);
};
}

#endif //HYBRID_JOIN_HANDSHAKEJOIN_H
