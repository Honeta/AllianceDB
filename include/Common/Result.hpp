#ifndef ALIANCEDB_SRC_COMMON_TYPES_CPP_RESULT_HPP_
#define ALIANCEDB_SRC_COMMON_TYPES_CPP_RESULT_HPP_

#include "Common/Tuple.hpp"
#include "Common/Types.hpp"

#include <tuple>

namespace AllianceDB {

struct ResultTuple {
  KeyType k;
  ValType v1, v2;
  ResultTuple(KeyType a, ValType b, ValType c) : k(a), v1(b), v2(c) {
    if (v1 > v2) {
      std::swap(v1, v2);
    }
  }
  bool operator==(const ResultTuple &rhs) const {
    return k == rhs.k && v1 == rhs.v1 && v2 == rhs.v2;
  }
  bool operator!=(const ResultTuple &rhs) const { return !(*this == rhs); }
  bool operator<(const ResultTuple &rhs) const {
    if (k != rhs.k)
      return k < rhs.k;
    if (v1 != rhs.v1)
      return v1 < rhs.v1;
    return v2 < rhs.v2;
  }
};
using WindowJoinResult = std::vector<ResultTuple>;

struct JoinResult {
  std::vector<WindowJoinResult> window_results;
  int joinNumber;
  int streamSize;
  std::string algoName;
  std::string dataSetName;
  double timeTaken;
  struct timeval timeBegin;
  JoinResult();
  void statPrinter();
  void Add(int wid, TuplePtr t1, TuplePtr t2);
  void Print();
  bool operator==(JoinResult &rhs) const;
  size_t Hash();
};

using ResultPtr = std::shared_ptr<JoinResult>;

} // namespace AllianceDB
#endif // ALIANCEDB_SRC_COMMON_TYPES_CPP_RESULT_HPP_
