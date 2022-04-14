//
// Created by Shuhao Zhang on 8/9/19.
//

#ifndef ALLIANCEDB_SORTMERGEJOIN_MULTIWAY_H
#define ALLIANCEDB_SORTMERGEJOIN_MULTIWAY_H


#include "../utils/types.h"              /* relation_t, tuple_t, result_t */

/**
 * "m-may sort-merge join"
 *
 * A Sort-Merge Join variant with partitioning and complete
 * sorting of both input relations. The merging step in this algorithm overlaps
 * the entire merging and transfer of remote chunks using a multi-way merge tree.
 *
 * @param relR input relation R
 * @param relS input relation S
 * @param joincfg configuration parameters of the join
 *
 * @warning this algorithm must be run with number of threads that is power of 2
 *
 * \ingroup Joins
 */
result_t *
sortmergejoin_multiway(relation_t *relR, relation_t *relS, joinconfig_t *joincfg, int exp_id, char *grp_id, int window_size, int gap);




#endif //ALLIANCEDB_SORTMERGEJOIN_MULTIWAY_H
