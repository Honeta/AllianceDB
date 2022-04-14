#!/bin/bash

gp=0
exp_dir="/data1/xtra"
L3_cache_size=20182588

# read arguments
helpFunction()
{
   echo ""
   echo "Usage: $0 -e exp_section -d exp_dir -c L3_cache_size"
   echo -e "\t-e the experiment section you would like to run"
   echo -e "\t-d the experiment results directory"
   echo -e "\t-c the L3 cache size of the current CPU"
   exit 1 # Exit script after printing help
}

while getopts "e:d:c:" opt
do
   case "$opt" in
      e ) exp_secction="$OPTARG" ;;
      d ) exp_dir="$OPTARG" ;;
      c ) L3_cache_size="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

## Print helpFunction in case parameters are empty
#if [ -z "$exp_secction" ] || [ -z "$exp_dir" ] || [ -z "$L3_cache_size" ]
#then
#   echo "Some or all of the parameters are empty";
#   helpFunction
#fi

# Begin script in case all parameters are correct
echo "$exp_secction"
echo "$exp_dir"
echo "$L3_cache_size"

APP_BENCH=0
MICRO_BENCH=0
SCALE_STUDY=0
PROFILE_MICRO=0
PROFILE=0
PROFILE_MEMORY_CONSUMPTION=0
PROFILE_PMU_COUNTERS=0
PROFILE_TOPDOWN=0
# parse exp sections need to run
IFS=','
for exp_secions_name in $(echo "$exp_secction");
do
    echo "name = $exp_secions_name"
    case "$exp_secions_name" in
      "APP_BENCH")
        APP_BENCH=1
        ;;
      "MICRO_BENCH"):
        MICRO_BENCH=1
        ;;
      "SCALE_STUDY")
        SCALE_STUDY=1
        ;;
      "PROFILE_MICRO")
        PROFILE_MICRO=1
        ;;
      "PROFILE")
        PROFILE=1
        ;;
      "PROFILE_MEMORY_CONSUMPTION")
        PROFILE_MEMORY_CONSUMPTION=1
        ;;
      "PROFILE_PMU_COUNTERS")
        PROFILE_PMU_COUNTERS=1
        ;;
      "PROFILE_TOPDOWN")
        PROFILE_TOPDOWN=1
        ;;
    esac
done

echo "Total EXPS: ${exp_secction}"


#set -e
## Set L3 Cache according to your machine.
sed -i -e "s/#define L3_CACHE_SIZE [[:alnum:]]*/#define L3_CACHE_SIZE $L3_cache_size/g" ../utils/params.h
# set experiment dir
sed -i -e "s/#define EXP_DIR .*/#define EXP_DIR "\"${exp_dir//\//\\/}\""/g" ../joins/common_functions.h

# NORMAL MODE
sed -i -e "s/#define PERF_COUNTERS/#define NO_PERF_COUNTERS/g" ../utils/perf_counters.h
sed -i -e "s/#define PROFILE_TOPDOWN/#define NO_PROFILE_TOPDOWN/g" ../utils/perf_counters.h
sed -i -e "s/#define PROFILE_MEMORY_CONSUMPTION/#define NO_PROFILE_MEMORY_CONSUMPTION/g" ../utils/perf_counters.h
sed -i -e "s/#define NO_TIMING/#define TIMING/g" ../joins/common_functions.h


# change cpu-mapping path here, e.g. following changes $exp_dir/cpu-mapping.txt to $exp_dir/cpu-mapping.txt
#sed -i -e "s/\/data1\/xtra\/cpu-mapping.txt/\/data1\/xtra\/cpu-mapping.txt/g" ../affinity/cpu_mapping.h

compile=1
function compile() {
  if [ $compile != 0 ]; then
    cd ..
    cmake . | tail -n +90
    cd scripts
    make -C .. clean -s
    make -C .. -j4 -s
  fi
  sudo setcap CAP_SYS_RAWIO+eip ../sorting
}

function benchmarkRun() {
  #####native execution
  echo "==benchmark:$benchmark -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -o $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt -I $id== "
  #echo 3 >/proc/sys/vm/drop_caches
  ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -o $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt -I $id > $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
  if [[ $? -eq 139 ]]; then echo "oops, sigsegv" exit 1; fi
}

function benchmarkProfileRun() {
  #####native execution
  echo "==benchmark:$benchmark -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -o $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt -I $id== "
  #echo 3 >/proc/sys/vm/drop_caches
  if [ ! -z "$PERF_CONF" -a "$PERF_CONF"!=" " ]; then
    ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -o $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt -p $PERF_CONF -I $id > $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
  else
    ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -o $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt -I $id > $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
  fi
  if [[ $? -eq 139 ]]; then echo "oops, sigsegv" exit 1; fi
}


function perfUarchBenchmarkRun() {
  #####native execution
  echo "==benchmark:$benchmark -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -o $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt -I $id== "
  if [ ! -z "$PERF_OUTPUT" -a "$PERF_OUTPUT"!=" " ]; then
    perf stat -x, -a -e CPU_CLK_UNHALTED.THREAD,IDQ_UOPS_NOT_DELIVERED.CORE,UOPS_ISSUED.ANY,UOPS_RETIRED.RETIRE_SLOTS,INT_MISC.RECOVERY_CYCLES,CYCLE_ACTIVITY.STALLS_MEM_ANY,RESOURCE_STALLS.SB -o $PERF_OUTPUT \
     ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -I $id > $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
  else
    perf stat -e CPU_CLK_UNHALTED.THREAD,IDQ_UOPS_NOT_DELIVERED.CORE,UOPS_ISSUED.ANY,UOPS_RETIRED.RETIRE_SLOTS,INT_MISC.RECOVERY_CYCLES,CYCLE_ACTIVITY.STALLS_MEM_ANY,RESOURCE_STALLS.SB \
     ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -I $id > $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
  fi
  if [[ $? -eq 139 ]]; then echo "oops, sigsegv" exit 1; fi
}

function perfUtilBenchmarkRun() {
  #####native execution
  echo "==benchmark:$benchmark -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -o $exp_dir/results/breakdown/perf_$id.csv -I $id== "
  #echo 3 >/proc/sys/vm/drop_caches
  perf stat -I10 -x, -o $exp_dir/results/breakdown/perf_$id.csv -e cache-misses,cycles ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -r $RSIZE -s $SSIZE -R $RPATH -S $SPATH -J $RKEY -K $SKEY -L $RTS -M $STS -n $Threads -B 1 -t 1 -g $gap -I $id > $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
  if [[ $? -eq 139 ]]; then echo "oops, sigsegv" exit 1; fi
}


function Run() {
  #####native execution
  echo "==benchmark:$benchmark -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -n $Threads=="
  #echo 3 >/proc/sys/vm/drop_caches
  ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -r $RSIZE -s $SSIZE -n $Threads
}

function KimRun() {
  #####native execution
  echo "==benchmark:$benchmark -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -e $STEP_SIZE -q $STEP_SIZE_S -l $INTERVAL -d $distrbution -z $skew -D $TS_DISTRIBUTION -Z $ZIPF_FACTOR -n $Threads -g $gap -P $DD -W $FIXS -I $id =="
  #echo 3 >/proc/sys/vm/drop_caches
  ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -e $STEP_SIZE -q $STEP_SIZE_S -l $INTERVAL -d $distrbution -z $skew -D $TS_DISTRIBUTION -Z $ZIPF_FACTOR -n $Threads -W $FIXS -g $gap -P $DD -I $id > $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
}

function KimProfileRun() {
  #####native execution
  echo "==benchmark:$benchmark -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -e $STEP_SIZE -q $STEP_SIZE_S -l $INTERVAL -d $distrbution -z $skew -D $TS_DISTRIBUTION -Z $ZIPF_FACTOR -n $Threads -g $gap -P $DD -W $FIXS -I $id =="
  #echo 3 >/proc/sys/vm/drop_caches
  if [ ! -z "$PERF_CONF" -a "$PERF_CONF"!=" " ]; then
    ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -e $STEP_SIZE -q $STEP_SIZE_S -l $INTERVAL -d $distrbution -z $skew -D $TS_DISTRIBUTION -Z $ZIPF_FACTOR -n $Threads -W $FIXS -g $gap -P $DD -o $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt -p $PERF_CONF -I $id > $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
  else
    ../sorting -a $algo -E $epsl_r -F $epsl_s -U $univ -Q $bern -t $ts -w $WINDOW_SIZE -e $STEP_SIZE -q $STEP_SIZE_S -l $INTERVAL -d $distrbution -z $skew -D $TS_DISTRIBUTION -Z $ZIPF_FACTOR -n $Threads -W $FIXS -g $gap -P $DD -o $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt -I $id > $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
  fi
}

function PARTITION_ONLY() {
  sed -i -e "s/#define JOIN/#define NO_JOIN/g" ../joins/common_functions.h
  sed -i -e "s/#define SORT/#define NO_SORT/g" ../joins/common_functions.h
  sed -i -e "s/#define NO_PARTITION/#define PARTITION/g" ../joins/common_functions.h
  sed -i -e "s/#define OVERVIEW/#define NO_OVERVIEW/g" ../joins/common_functions.h
}
function PARTITION_BUILD_SORT() {
  sed -i -e "s/#define JOIN/#define NO_JOIN/g" ../joins/common_functions.h
  sed -i -e "s/#define NO_SORT/#define SORT/g" ../joins/common_functions.h
  sed -i -e "s/#define NO_PARTITION/#define PARTITION/g" ../joins/common_functions.h
  sed -i -e "s/#define OVERVIEW/#define NO_OVERVIEW/g" ../joins/common_functions.h
}
function PARTITION_BUILD_SORT_MERGE_JOIN() {
  sed -i -e "s/#define NO_JOIN/#define JOIN/g" ../joins/common_functions.h
  sed -i -e "s/#define SORT/#define NO_SORT/g" ../joins/common_functions.h
  sed -i -e "s/#define PARTITION/#define NO_PARTITION/g" ../joins/common_functions.h
  sed -i -e "s/#define OVERVIEW/#define NO_OVERVIEW/g" ../joins/common_functions.h
}

function OVERVIEW() {
  sed -i -e "s/#define JOIN/#define NO_JOIN/g" ../joins/common_functions.h
  sed -i -e "s/#define SORT/#define NO_SORT/g" ../joins/common_functions.h
  sed -i -e "s/#define PARTITION/#define NO_PARTITION/g" ../joins/common_functions.h
  sed -i -e "s/#define NO_OVERVIEW/#define OVERVIEW/g" ../joins/common_functions.h
}

# Different execution mode for different experiments

function PCM() {
  sed -i -e "s/#define TIMING/#define NO_TIMING/g" ../joins/common_functions.h #disable time measurement
  sed -i -e "s/#define NO_PERF_COUNTERS/#define PERF_COUNTERS/g" ../utils/perf_counters.h # enable pcm counter
  sed -i -e "s/#define PROFILE_TOPDOWN/#define NO_PROFILE_TOPDOWN/g" ../joins/common_functions.h # disable perf
  sed -i -e "s/#define PROFILE_MEMORY_CONSUMPTION/#define NO_PROFILE_MEMORY_CONSUMPTION/g" ../joins/common_functions.h # enable memory consumption
}

function PERF() {
  sed -i -e "s/#define TIMING/#define NO_TIMING/g" ../joins/common_functions.h #disable time measurement
  sed -i -e "s/#define PERF_COUNTERS/#define NO_PERF_COUNTERS/g" ../utils/perf_counters.h
  sed -i -e "s/#define NO_PROFILE_TOPDOWN/#define PROFILE_TOPDOWN/g" ../joins/common_functions.h
  sed -i -e "s/#define PROFILE_MEMORY_CONSUMPTION/#define NO_PROFILE_MEMORY_CONSUMPTION/g" ../joins/common_functions.h
}

function MEM_MEASURE() {
  sed -i -e "s/#define TIMING/#define NO_TIMING/g" ../joins/common_functions.h
  sed -i -e "s/#define PERF_COUNTERS/#define NO_PERF_COUNTERS/g" ../utils/perf_counters.h
  sed -i -e "s/#define PROFILE_TOPDOWN/#define NO_PROFILE_TOPDOWN/g" ../joins/common_functions.h
  sed -i -e "s/#define NO_PROFILE_MEMORY_CONSUMPTION/#define PROFILE_MEMORY_CONSUMPTION/g" ../joins/common_functions.h
}

function NORMAL() {
  sed -i -e "s/#define NO_TIMING/#define TIMING/g" ../joins/common_functions.h #disable time measurement
  sed -i -e "s/#define PERF_COUNTERS/#define NO_PERF_COUNTERS/g" ../utils/perf_counters.h
  sed -i -e "s/#define PROFILE_TOPDOWN/#define NO_PROFILE_TOPDOWN/g" ../joins/common_functions.h
  sed -i -e "s/#define PROFILE_MEMORY_CONSUMPTION/#define NO_PROFILE_MEMORY_CONSUMPTION/g" ../joins/common_functions.h
}

function SetStockParameters() { #matches: 15595000. #inputs= 60527 + 77227
  ts=1 # stream case
  WINDOW_SIZE=1000
  RSIZE=60527
  SSIZE=77227
  RPATH=$exp_dir/datasets/stock/cj_1000ms_1t.txt
  SPATH=$exp_dir/datasets/stock/sb_1000ms_1t.txt
  RKEY=0
  SKEY=0
  RTS=1
  STS=1
  gap=15595
}

function SetRovioParameters() { #matches: 87856849382 #inputs= 2873604 + 2873604
  ts=1 # stream case
  WINDOW_SIZE=1000
  RSIZE=2873604
  SSIZE=2873604
  RPATH=$exp_dir/datasets/rovio/1000ms_1t.txt
  SPATH=$exp_dir/datasets/rovio/1000ms_1t.txt
  RKEY=0
  SKEY=0
  RTS=3
  STS=3
  gap=87856849
}

function SetYSBParameters() { #matches: 10000000. #inputs= 1000 + 10000000
  ts=1 # stream case
  WINDOW_SIZE=1000
  RSIZE=1000
  SSIZE=10000000
  RPATH=$exp_dir/datasets/YSB/campaigns_id.txt
  SPATH=$exp_dir/datasets/YSB/ad_events.txt
  RKEY=0
  SKEY=0
  RTS=0
  STS=1
  gap=10000
}

function SetDEBSParameters() { #matches: 251033140 #inputs= 1000000 + 1000000
  ts=1 # stream case
  WINDOW_SIZE=0
  RSIZE=1000000 #1000000
  SSIZE=1000000 #1000000
  RPATH=$exp_dir/datasets/DEBS/posts_key32_partitioned.csv
  SPATH=$exp_dir/datasets/DEBS/comments_key32_partitioned.csv
  RKEY=0
  SKEY=0
  RTS=0
  STS=0
  gap=251033
}

DEFAULT_WINDOW_SIZE=1000 #(ms) -- 1 seconds
DEFAULT_STEP_SIZE=12800  # |tuples| per ms. -- 128K per seconds. ## this controls the guranalrity of input stream.
function ResetParameters() {
  TS_DISTRIBUTION=0                # uniform time distribution
  ZIPF_FACTOR=0                    # uniform time distribution
  distrbution=0                    # unique
  skew=0                           # uniform key distribution
  INTERVAL=1                       # interval of 1. always..
  STEP_SIZE=$DEFAULT_STEP_SIZE     # arrival rate = 1000 / ms
  WINDOW_SIZE=$DEFAULT_WINDOW_SIZE # MS rel size = window_size / interval * step_size.
  STEP_SIZE_S=128000               # let S has the same arrival rate of R.
  FIXS=1
  ts=1 # stream case
  Threads=8
  gap=12800
  DD=1
  sed -i -e "s/scalarflag [[:alnum:]]*/scalarflag 0/g" ../joins/common_functions.h
}

#recompile by default.
compile
# Configurable variables
# Generate a timestamp
timestamp=$(date +%Y%m%d-%H%M)
output=test$timestamp.txt

# sed -i -e "s/#define NO_SET_PR/#define SET_PR/g" ../main.cpp
sed -i -e "s/#define SET_PR/#define NO_SET_PR/g" ../main.cpp
sed -i -e "s/#define NO_SAMPLE_ON/#define SAMPLE_ON/g" ../main.cpp
sed -i -e "s/#define NO_AVX_RAND/#define AVX_RAND/g" ../main.cpp


function IF_SET_PR()
{
  if [ $setpr == 0 ]; then
    sed -i -e "s/#define NO_SET_PR/#define SET_PR/g" ../main.cpp
  fi
  if [ $setpr == 1 ]; then
    sed -i -e "s/#define SET_PR/#define NO_SET_PR/g" ../main.cpp
  fi
}


declare -a arr

# arr=( '1 0.1 1 0.1' '0.1 1 0.1 1' '0.3 0.333 0.3 0.333' '0.333 0.3 0.333 0.3' '0.667 0.15 0.667 0.15' '0.15 0.667 0.15 0.667' )
arr=( '0.1 0.1 1 0.1' '0.1 0.1 1 0.1' '0.1 0.1 1 0.1' '0.1 0.1 0.3 0.333' '0.1 0.1 0.3 0.333' '0.1 0.1 0.3 0.333' '0.1 0.1 0.667 0.15' '0.1 0.1 0.667 0.15' '0.1 0.1 0.667 0.15' '0.1 0.1 0.1 1' '0.1 0.1 0.1 1' '0.1 0.1 0.1 1' )

gp=10

for setpr in 0 1; do
IF_SET_PR
for rand_pair in "${arr[@]}"; do
eval real_pair=(${rand_pair})
epsl_r=${real_pair[0]};
epsl_s=${real_pair[1]};
univ=${real_pair[2]};
bern=${real_pair[3]};
let "gp++"
# APP_Bench.
#APP_BENCH=0
if [ $APP_BENCH == 1 ]; then
  NORMAL
  profile_breakdown=1
  compile=1
  for algo in m-way m-pass; do
    for benchmark in "Stock" "Rovio" "YSB" "DEBS"; do #
      case "$benchmark" in
      "Stock")
        id=38
        ResetParameters
        SetStockParameters
        benchmarkRun
        ;;
      "Rovio") #matches:
        id=39
        ResetParameters
        SetRovioParameters
        benchmarkRun
        ;;
      "YSB")
        id=40
        ResetParameters
        SetYSBParameters
        benchmarkRun
        ;;
      "DEBS")
        id=41
        ResetParameters
        SetDEBSParameters
        benchmarkRun
        ;;
      esac
    done
  done
fi

done
done
exit

# APP_Bench.
#APP_BENCH=0
if [ $APP_BENCH == 1 ]; then
  NORMAL
  profile_breakdown=1
  compile=1
  for algo in m-way m-pass; do
    for benchmark in "Stock" "Rovio" "YSB" "DEBS"; do #
      case "$benchmark" in
      "Stock")
        id=38
        ResetParameters
        SetStockParameters
        benchmarkRun
        ;;
      "Rovio") #matches:
        id=39
        ResetParameters
        SetRovioParameters
        benchmarkRun
        ;;
      "YSB")
        id=40
        ResetParameters
        SetYSBParameters
        benchmarkRun
        ;;
      "DEBS")
        id=41
        ResetParameters
        SetDEBSParameters
        benchmarkRun
        ;;
      esac
    done
  done
fi

#MICRO benchmark.
#MICRO_BENCH=0
if [ $MICRO_BENCH == 1 ]; then
  NORMAL
  profile_breakdown=0
  compile=0
  for algo in m-way m-pass; do
    for benchmark in "AR" "RAR" "AD" "KD" "WS" "DD"; do #
      case "$benchmark" in
      # Batch -a SHJ_JM_NP -n 8 -t 1 -w 1000 -e 1000 -l 10 -d 0 -Z 1
      "AR") #test arrival rate and assume both inputs have same arrival rate.
        id=0
        ResetParameters
        FIXS=0 #varying both.
        ts=1   # stream case
        # step size should be bigger than nthreads
        for STEP_SIZE in 1600 3200 6400 12800 25600; do
          #WINDOW_SIZE=$(expr $DEFAULT_WINDOW_SIZE \* $DEFAULT_STEP_SIZE / $STEP_SIZE) #ensure relation size is the same.
          echo relation size is $(expr $WINDOW_SIZE / $INTERVAL \* $STEP_SIZE)
          gap=$(($STEP_SIZE / 500 * $WINDOW_SIZE))
          KimRun
          let "id++"
        done
        ;;
      "RAR") #test relative arrival rate when R is small
        id=5
        ResetParameters
        FIXS=1
        echo test relative arrival rate 5 - 9
        ts=1 # stream case
        # step size should be bigger than nthreads
        # remember to fix the relation size of S.
        STEP_SIZE=1600
        for STEP_SIZE_S in 1600 3200 6400 12800 25600; do
          #        WINDOW_SIZE=$(expr $DEFAULT_WINDOW_SIZE \* $DEFAULT_STEP_SIZE / $STEP_SIZE) #ensure relation size is the same.
          echo relation size is $(expr $WINDOW_SIZE / $INTERVAL \* $STEP_SIZE)
          gap=$(($STEP_SIZE / 500 * $WINDOW_SIZE))
          KimRun
          let "id++"
        done
        ;;
      "AD") #test arrival distribution
        id=10
        ResetParameters
        FIXS=1
        STEP_SIZE=1600
        STEP_SIZE_S=1600
        TS_DISTRIBUTION=2
        echo test varying timestamp distribution 10 - 14
        for ZIPF_FACTOR in 0 0.4 0.8 1.2 1.6; do #
          gap=$(($STEP_SIZE / 500 * $WINDOW_SIZE))
          KimRun
          let "id++"
        done
        ;;
      "KD") #test key distribution
        id=15
        ## Figure 4
        ResetParameters
        FIXS=1
        STEP_SIZE=12800
        STEP_SIZE_S=12800
        gap=$(($STEP_SIZE / 500 * $WINDOW_SIZE))
        echo test varying key distribution 15 - 19
        distrbution=2 #varying zipf factor
        for skew in 0 0.4 0.8 1.2 1.6; do
          if [ $skew == 1.2 ]; then
            gap=100
          fi
          if [ $skew == 1.6 ]; then
            gap=1
          fi
          KimRun
          let "id++"
        done
        ;;
      "WS") #test window size
        id=20
        ## Figure 5
        ResetParameters
        FIXS=1
        STEP_SIZE=6400
        STEP_SIZE_S=6400
        echo test varying window size 20 - 24
        for WINDOW_SIZE in 500 1000 1500 2000 2500; do
          gap=$(($STEP_SIZE / 1000 * $WINDOW_SIZE))
          KimRun
          let "id++"
        done
        ;;
      "DD") #test data duplication
        id=25
        ## Figure 6
        ResetParameters
        FIXS=1
        ts=1
        STEP_SIZE=6400
        STEP_SIZE_S=6400
        echo test DD 25 - 28
        for DD in 1 100 1000 10000; do
          gap=$(($STEP_SIZE * $WINDOW_SIZE * $DD / 500))
          KimRun
          let "id++"
        done
        ;;
      esac
    done
  done
fi

#SCLAE benchmark.
#SCALE_STUDY=0
if [ $SCALE_STUDY == 1 ]; then
  NORMAL
  profile_breakdown=0
  compile=0
  for algo in m-way m-pass; do
    for benchmark in "ScaleStock" "ScaleRovio" "ScaleYSB" "ScaleDEBS"; do #
      case "$benchmark" in
      "ScaleStock")
        id=42
        ResetParameters
        SetStockParameters
        echo test scalability of Stock 42 - 45
        for Threads in 1 2 4 8; do
          benchmarkRun
          let "id++"
        done
        ;;
      "ScaleRovio")
        id=46
        ResetParameters
        SetRovioParameters
        echo test scalability 46 - 49
        for Threads in 1 2 4 8; do
          benchmarkRun
          let "id++"
        done
        ;;
      "ScaleYSB")
        id=50
        ResetParameters
        SetYSBParameters
        echo test scalability 50 - 53
        for Threads in 1 2 4 8; do
          benchmarkRun
          let "id++"
        done
        ;;
      "ScaleDEBS")
        id=54
        ResetParameters
        SetDEBSParameters
        echo test scalability 54 - 57
        for Threads in 1 2 4 8; do
          benchmarkRun
          let "id++"
        done
        ;;
      esac
    done
  done
fi

## MICRO STUDY
#PROFILE_MICRO=0
if [ $PROFILE_MICRO == 1 ]; then
  NORMAL
  profile_breakdown=1                                                                     #compile depends on whether we want to profile.
  compile=1                                                                               #enable compiling.
  for benchmark in "SIMD_STUDY"; do #
    case "$benchmark" in
    "SIMD_STUDY")
      id=100
      ResetParameters
      ts=0 # batch data.
      echo SIMD 100-103
      PARTITION_ONLY
      compile=1
      for algo in "m-way" "m-pass"; do
        for scalar in 0 1; do
          sed -i -e "s/scalarflag [[:alnum:]]*/scalarflag $scalar/g" ../joins/common_functions.h
          compile
          KimRun
          let "id++"
        done
      done
      PARTITION_BUILD_SORT
      compile=1
      for algo in "m-way" "m-pass"; do
        for scalar in 0 1; do
          sed -i -e "s/scalarflag [[:alnum:]]*/scalarflag $scalar/g" ../joins/common_functions.h
          compile
          KimRun
          let "id++"
        done
      done
      ;;
    esac
  done
fi

#PROFILE=0 ## Cache misses profiling, please run the program with sudo
if [ $PROFILE == 1 ]; then
  PCM
  profile_breakdown=0                                                                    #compile depends on whether we want to profile.
  compile=1                                                                               #enable compiling.

  for benchmark in "YSB"; do
    id=201
    PARTITION_ONLY
    compile=1
    compile
    for algo in "m-way" "m-pass"; do
      case "$benchmark" in
      "YSB")
        ResetParameters
        SetYSBParameters
        rm $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
        benchmarkRun
        ;;
      esac
      let "id++"
    done

    PARTITION_BUILD_SORT_MERGE_JOIN
    compile=1
    compile
    for algo in "m-way" "m-pass"; do
      case "$benchmark" in
      "YSB")
        ResetParameters
        SetYSBParameters
        rm $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
        benchmarkRun
        ;;
      esac
      let "id++"
    done
  done
  NORMAL
fi

#export PATH=~/workspace/pmu-tools:$PATH
#PROFILE_MEMORY_CONSUMPTION=1 ## Hardware Counters profiling with YSB, please run the program with sudo
if [ $PROFILE_MEMORY_CONSUMPTION == 1 ]; then
  MEM_MEASURE
  profile_breakdown=0
  compile=1
  compile
  for benchmark in "Rovio"; do #"YSB
    id=300
    for algo in "m-way" "m-pass"; do
      case "$benchmark" in
      "Kim")
        ResetParameters
        #        SetYSBParameters
        #        SetDEBSParameters
        STEP_SIZE=1280
        STEP_SIZE_S=12800
        WINDOW_SIZE=10000
        rm $exp_dir/results/breakdown/perf_$id.csv
        KimRun
        ;;
      "YSB")
        ResetParameters
        SetYSBParameters
        rm $exp_dir/results/breakdown/perf_${gp}_${id}.txt
        benchmarkRun
        ;;
      "Rovio")
        ResetParameters
        SetRovioParameters
        rm $exp_dir/results/breakdown/perf_${gp}_${id}.txt
        benchmarkRun
        ;;
      esac
      let "id++"
    done
  done
  NORMAL
fi

#PROFILE_PMU_COUNTERS=1 # profile PMU counters using pcm
if [ $PROFILE_PMU_COUNTERS == 1 ]; then
  PCM
  profile_breakdown=0

  for benchmark in "Rovio"; do
    id=400
    OVERVIEW
    compile=1
    compile
    for algo in "m-way" "m-pass"; do # "m-way" "m-pass"
      case "$benchmark" in
      "Rovio")
        ResetParameters
        SetRovioParameters
        rm $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
        PERF_CONF=$exp_dir/pcm.cfg
        benchmarkProfileRun
        PERF_CONF=$exp_dir/pcm2.cfg
        benchmarkProfileRun
        PERF_CONF=""
        benchmarkProfileRun
        ;;
      "YSB")
        ResetParameters
        SetYSBParameters
        rm $exp_dir/results/breakdown/${benchmark}_${algo}_profile_${gp}_${id}.txt
        PERF_CONF=$exp_dir/pcm.cfg
        benchmarkProfileRun
        PERF_CONF=$exp_dir/pcm2.cfg
        benchmarkProfileRun
        PERF_CONF=""
        benchmarkProfileRun
        ;;
      esac
      let "id++"
    done
  done
  NORMAL
fi

#PROFILE_TOPDOWN=1 ## profile intel topdown performance metrics using perf/pcm
if [ $PROFILE_TOPDOWN == 1 ]; then
  # copy custom pcm event counters to the $exp_dir
  PERF

  for benchmark in "Rovio"; do
    id=400
    for algo in "m-way" "m-pass"; do # "m-way" "m-pass"
      case "$benchmark" in
      "YSB")
        ResetParameters
        SetYSBParameters
        # with JOIN
        sed -i -e "s/#define NO_JOIN_THREAD/#define JOIN_THREAD/g" ../joins/common_functions.h # profile with join logic, only works for PROFILE_TOPDOWN
        profile_breakdown=0
        compile=1
        compile
        PERF_OUTPUT=$exp_dir/results/breakdown/profile_w_join_${gp}_${id}.txt
        # without JOIN
        perfUarchBenchmarkRun
        sed -i -e "s/#define JOIN_THREAD/#define NO_JOIN_THREAD/g" ../joins/common_functions.h # disable join logic
        compile=1
        compile
        PERF_OUTPUT=$exp_dir/results/breakdown/profile_wo_join_${gp}_${id}.txt
        perfUarchBenchmarkRun
        ;;

      "Rovio")
        ResetParameters
        SetRovioParameters
        # with JOIN
        sed -i -e "s/#define NO_JOIN_THREAD/#define JOIN_THREAD/g" ../joins/common_functions.h
        profile_breakdown=0
        compile=1
        compile
        PERF_OUTPUT=$exp_dir/results/breakdown/profile_w_join_${gp}_${id}.txt
        # without JOIN
        perfUarchBenchmarkRun
        sed -i -e "s/#define JOIN_THREAD/#define NO_JOIN_THREAD/g" ../joins/common_functions.h
        compile=1
        compile
        PERF_OUTPUT=$exp_dir/results/breakdown/profile_wo_join_${gp}_${id}.txt
        perfUarchBenchmarkRun
        ;;
      esac
      let "id++"
    done
  done
  NORMAL
fi
