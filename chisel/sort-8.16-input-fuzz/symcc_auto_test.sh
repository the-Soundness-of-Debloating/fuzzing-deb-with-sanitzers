#!/bin/bash
home_folder=$(pwd)
program_name=sort-8.16
start_num=$1
end_num=$2
cpu=$3


# compile 
/workspace/symcc/symcc $program_name.c.reduced.c -w -lpthread -o $home_folder/bins/symcc.reduced.out

export SYMCC_TARGET=$home_folder/bins/symcc.reduced.out
export AFL_CUSTOM_MUTATOR_LIBRARY=/workspace/AFLplusplus/custom_mutators/symcc/symcc-mutator.so

result_root_dir=$home_folder/result/symcc_result
mkdir -p $result_root_dir

bash -x ./afl_auto_test.sh reduced nosan $start_num $end_num $cpu $result_root_dir


unset SYMCC_TARGET
unset AFL_CUSTOM_MUTATOR_LIBRARY
