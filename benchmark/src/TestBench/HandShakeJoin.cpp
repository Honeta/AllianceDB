//
// Created by Wang Chenyu on 15/12/21.
//
//
// Created by Wang Chenyu on 15/12/21.
//

#include <TestBench/HandShakeJoin.h>
#include <thread>
#include <iostream>
#include <WindowSlider/HandShakeWS.h>
AllianceDB::TuplePtrQueueIn RecvQueueR[THREAD_NUMBER + 1];
AllianceDB::TuplePtrQueueIn RecvQueueS[THREAD_NUMBER + 1];

AllianceDB::numberType threadJoinResultSHJ[THREAD_NUMBER];
AllianceDB::RelationCouple relationCoupleShared;

int fetchRThreadId = 0;
int fetchSThreadId = THREAD_NUMBER - 1;

void AllianceDB::HandShakeJoin::execute(AllianceDB::Result &joinResult, AllianceDB::RelationCouple &relationCouple) {
  relationCoupleShared = relationCouple;
  //determine the sub-window size for each thread. Yeah

  //execute
  std::thread threadArray[THREAD_NUMBER];
  //Thread creation
  int base = WINDOW_SIZE / THREAD_NUMBER;
  int module = WINDOW_SIZE % THREAD_NUMBER;
  for (int id = 0; id < THREAD_NUMBER; id++) {
    threadJoinResultSHJ[id] = 0;
    int threadWindowSize = (id < module) ? base + 1 : base;
    std::cout << id << "-" << threadWindowSize << "\n";
    threadArray[id] = std::thread(threadWork, id, threadWindowSize);
  }

  //Join and get the join result
  for (int id = 0; id < THREAD_NUMBER; id++) {
    threadArray[id].join();
    std::cout << id << " result " << threadJoinResultSHJ[id] << "\n";
    joinResult.joinNumber += threadJoinResultSHJ[id];
  }
}

void
AllianceDB::HandShakeJoin::threadWork(int id, AllianceDB::numberType windowSize) {
  TuplePtrQueueIn &threadLeftRecvQueueR = RecvQueueR[id];
  TuplePtrQueueIn &threadLeftSendQueueS = RecvQueueS[id];
  TuplePtrQueueIn &threadRightSendQueueR = RecvQueueR[id + 1];
  TuplePtrQueueIn &threadRightRecvQueueS = RecvQueueS[id + 1];
  TuplePtrQueueIn forwardedTuple;

  AllianceDB::WindowCouple windowCouple = AllianceDB::WindowCouple(windowSize);



  //Let the first and the last thread be fetcher
  if (id == fetchRThreadId) threadLeftRecvQueueR = relationCoupleShared.relationR;
  if (id == fetchSThreadId) threadRightRecvQueueS = relationCoupleShared.relationS;

  for (int kkk = 0; kkk < 1000000; kkk++) {
    //process_left()
    if (!threadLeftRecvQueueR.empty()) {
      //fetch that tuple
      AllianceDB::TuplePtr tuple = threadLeftRecvQueueR.front();
      threadLeftRecvQueueR.pop();
      //nullptr is an ack for information
      if (tuple == nullptr) {
        std::cout << "GET NULL!" << "\n";
        windowCouple.hashtableS.erase(forwardedTuple.front()->key, forwardedTuple.front()->subKey);
        forwardedTuple.pop();
      }

        //else, join (scan + insert)
      else {
        //scan S-hashtable
        auto findMatchS = windowCouple.hashtableS.find(tuple->key);
        if (findMatchS != windowCouple.hashtableS.end()) {
          threadJoinResultSHJ[id] += findMatchS->second.size();
          //cout<<"match "<<findMatchS->second.size()<<" tuples"<<endl;
        } else {
          cout << "no match " << endl;
        }
        //insert R into R-window and R-hashtable

        size_t sk = windowCouple.hashtableR.emplace(tuple->key, 0);
        tuple->subKey = sk;
        windowCouple.windowR.push(tuple);
      }
    }
    //process_right()
    if (!threadRightRecvQueueS.empty()) {
      //fetch that tuple
      AllianceDB::TuplePtr tuple = threadRightRecvQueueS.front();
      threadRightRecvQueueS.pop();
      //scan R-hashtable
      auto findMatchR = windowCouple.hashtableR.find(tuple->key);
      if (findMatchR != windowCouple.hashtableR.end()) {
        threadJoinResultSHJ[id] += findMatchR->second.size();
      }
      //insert S into S-window and S-hashtable
      size_t sk = windowCouple.hashtableS.emplace(tuple->key, 0);
      tuple->subKey = sk;
      windowCouple.windowS.push(tuple);

      //place ack in rightSendQueue
      threadRightSendQueueR.push(nullptr);
    }

    //forward_tuples()
    if (windowCouple.windowS.size() > windowCouple.windowSize) {
      //place oldest non-forwarded si into leftSendQueue
      AllianceDB::TuplePtr tupleOnAir = windowCouple.windowS.front();
      threadLeftSendQueueS.push(tupleOnAir);
      //mark si as forwarded  (delete it from the queue but left it in the hashtable and put it into the forwardedTuple queue)
      windowCouple.windowS.pop();
      forwardedTuple.push(tupleOnAir);
    }
    /*if (windowCouple.windowR.size() > windowCouple.windowSize) {
      //place oldest ri into rightSendQueue
      INTELLI::TuplePtr tupleOnAir = windowCouple.windowR.front();
      threadRightSendQueueR.push(tupleOnAir);
      //Remove ri from R-window
      windowCouple.hashtableR.erase(windowCouple.windowR.front()->key, windowCouple.windowR.front()->subKey);
      windowCouple.windowR.pop();
    }*/
  }
}
