/*! \file Types.h*/
//
// Created by Wang Chenyu on 1/9/21.
//
#ifndef UNUSED
#define UNUSED(x) (void)(x)
#endif

#ifndef INTELLISTREAM_TYPES_H
#define INTELLISTREAM_TYPES_H

#ifndef ALGO_NAME

//#define ALGO_NAME "OneWayHashJoin"
#define ALGO_NAME "CellJoin"
//#define ALGO_NAME "HandShakeJoin"

#endif

#ifndef ALGO_CLASS

//#define ALGO_CLASS OneWayHashJoin
#define ALGO_CLASS CellJoin
//#define ALGO_CLASS HandShakeJoin

#endif

//Constants
#ifndef WINDOW_SIZE
#define WINDOW_SIZE 50
#endif

#ifndef THREAD_NUMBER
#define THREAD_NUMBER 2
#endif

#ifndef TIME_STEP
#define TIME_STEP 10// US
#endif
#ifndef DATASET_NAME
#define DATASET_NAME "Test1" //dataset name should be DATASET_NAME + "-R.txt" and DATASET_NAME + "-S.txt"
//in Test2, we manually assigned duplicated keys
#endif

#include <cstdint>
#include <vector>
#include <memory>
#include <mutex>
#include <unordered_map>
#include <queue>
#include "Utils/concurrentqueue.h"
#include "Utils/DupicatedHashTable.hpp"
#include "Utils/SafeQueue.hpp"
#include "Utils/SPSCQueue.hpp"

/**
 * @mainpage Introduction
 * The AianceDB offers a wide range of stream join algorithms, supporting both inter and
 * intra window join.
 * @section sec_mj Major Parts
 * Three major parts are composed to achieve ultra-fast stream window join, and they can be found in corresponding named
 * folder under include or src
 *
 * @subsection JoinAlgo
 * Here are specific algorithms to eventually deal with stream join, including hash or radix.
 * All of these algos assume the tuples are batched, and the "window" is invisible to them. In another word,
 * they achieve the intra-window join.
 *
 * @subsection JoinProcessor
 * Here is the middle layer of the whole stream window join, i.e., to bridge the "window" and "join".
 * One JoinProcessor may either eagerly do stream join on itself,
 * or just accumulate the tuples and evoke JoinAlgo  for lazy join. JoinProcessors are managed by upper windowslider.
 *
 * @subsection WindowSlider
 * Here is the top layer on all. Typically, the WindowSliders will:
 * \li Directly receive user input by feedTupleS/R
 * \li Globally manage the sliding window
 * \li Pass tuple to and control its JoinProcessors.
 *
 * Please find them in @ref WindowSliders module
 * @section sec_other Other Parts
 * Besides the 3 above, Aliance DB has other parts to support its work, they are:
 * @subsection subsec_common Common
 * Common functions, data types for all aliance db component, and they are especially designed for aliance db.
 * Please refer to @ref Common module.
 * @subsection subsec_utils Utils
 * Similar to @ref subsec_common, but they are not specialized for aliance db. On the contrary, they may be shared by other InteliStream
 * programs or third-party programs. Please refer to @ref INTELLI_UTIL module.
 */

namespace INTELLI {
/**
 * @defgroup Common Common Datastructure and Functions
 *  @{
 */
//Pointers


//Alias
typedef uint64_t keyType;    /*!< Type of the join key, default uint64_t */
typedef uint64_t valueType;  /*!< Type of the payload, default uint64_t */
typedef int numberType; //for counting the number of datagram (eg: tuples) in a struct
typedef std::mutex mutex;
typedef std::DupicatedHashTable<keyType, keyType> hashtable; /*!< allow key duplication */

typedef std::queue<numberType> tupleKeyQueue;
/**
 * @class Tuple Common/Types.h
 * @brief The class to describe a tuple
 */
class Tuple {
 public:
  keyType key; /*!< The key used for relational join*/
  valueType payload; /*!< The payload, can also be pointer*/
  // The subKey can be either time-stamp or arrival count, which is assigned by join system
  // We use the subKey to do tuple expiration, which covers both count-based and time-based window
  size_t subKey = 0;/*!< subkey is preserved for join system, e.g., it can be the time stamp or tuple count*/
  /**
   * @brief construct with key
   * @param k the key
   */
   Tuple(keyType k);
  /**
 * @brief construct with key and value
 * @param k the key
   *@param v the value of payload
 */
   Tuple(keyType k, valueType v);
  /**
 * @brief construct with key, value and subkey
 * @param k the key
   *@param v the value of payload
   * @param sk the subkey
 */
   Tuple(keyType k, valueType v, size_t sk);
  ~Tuple();
};
/**
 * @cite TuplePtr
 * @brief The class to describe a shared pointer to @ref Tuple
 */
typedef std::shared_ptr<class Tuple> TuplePtr;
typedef std::shared_ptr<class RelationCouple> RelationCouplePtr;

//Array Pointers
typedef std::vector<TuplePtr> WindowOfTuples;

//typedef std::SafeQueue<TuplePtr> TupleQueuePtrLocal;
/**
 * @typedef TupleQueuePtrLocal
 * @brief To describe a local queue of TuplePtr
 * @warning This is not thread-safe, only used for local data
 */
typedef std::queue<TuplePtr> TupleQueuePtrLocal;
typedef moodycamel::ConcurrentQueue<TuplePtr> concurrentTupleQueue;
class RelationCouple {
 public:
  TupleQueuePtrLocal relationS;
  TupleQueuePtrLocal relationR;
  RelationCouple();
  ~RelationCouple();
};

class WindowCouple {
 public:
  //We use queue to implement a window, it stores the sequence of tuples.
  TupleQueuePtrLocal windowS;
  TupleQueuePtrLocal windowR;
  hashtable hashtableS;
  hashtable hashtableR;

  numberType windowSize;
  numberType windowSizeR;
  numberType windowSizeS;

  mutex windowLock;

  WindowCouple(numberType windowSize);
  WindowCouple(numberType windowSizeR, numberType windowSizeS);
};

class ConcurrentQWindowCouple {
 public:
  //We use queue to implement a window, it stores the sequence of tuples.
  //Concurrent Q but not concurrent hashtable
  //A sub-window that can be obtained from other threads
  concurrentTupleQueue windowS;
  concurrentTupleQueue windowR;
  hashtable hashtableS;
  hashtable hashtableR;

  numberType windowSize;
  numberType windowSizeR;
  numberType windowSizeS;

  mutex windowLock;

  ConcurrentQWindowCouple(numberType windowSize);
  ConcurrentQWindowCouple(numberType windowSizeR, numberType windowSizeS);
};

class Result {
 public:
  numberType joinNumber;
  numberType streamSize;
  double timeTaken;
  struct timeval timeBegin;
  explicit Result();
  Result operator++(int);
  void statPrinter();
};
/**
 *  @typedef TupleQueuePtr
 * @brief To describe a queue of @ref TuplePtr under SPSCQueue
 * @note This one is thread-safe
 * @warning Must be inited by @ref newTupleQueuePtr before use
 */
typedef std::shared_ptr<INTELLI::SPSCQueue<INTELLI::TuplePtr>> TupleQueuePtr;
typedef std::shared_ptr<std::queue<INTELLI::TuplePtr>> TupleQueueSelfPtr;
typedef std::shared_ptr<INTELLI::SPSCQueue<vector<INTELLI::TuplePtr>>> WindowQueue;
/**
 * @cite newTupleQueuePtr
 * @brief To create a new TupleQueuePtr
 * @param n The length of queue
 */
#define  newTupleQueuePtr(n) make_shared<INTELLI::SPSCQueue<INTELLI::TuplePtr>>(n)
#define  newWindowQueue(n) make_shared<INTELLI::SPSCQueue<WindowOfTuples>>(n)
typedef enum {
  CNT_BASED = 1,
  TIME_STAMP_BASED = 2,
} join_type_t;
typedef enum {
  CMD_ACK = 1,
  CMD_STOP = 2,
  //S is a window, R is a Tuple
  CMD_NEXT_WSTR,
  CMD_NEXT_WSTS,
  CMD_NEXT_TSWR,
  CMD_NEXT_TSTR,
  CMD_NEXT_TS_ONLY,
  CMD_NEXT_TR_ONLY,
} join_cmd_t;
typedef std::shared_ptr<INTELLI::SPSCQueue<INTELLI::join_cmd_t>> CmdQueuePtr;
#define  newCmdQueue(n) make_shared<INTELLI::SPSCQueue<INTELLI::join_cmd_t>>(n)
}

#endif //INTELLISTREAM_TYPES_H
/**@}*/