#!/bin/bash
###
## A handy dandy script for running the Graphite case with OpenMP
## and MPI.
## 
## Deletes a variety of files so run at your own risk! 
###


# WORKING_MODE="$1"
# DP_OUTPUT_DIR="$2"
# CONTROL_DIR=$PWD
ABINIT_IN_FILE="$1"
ABINIT_LOG_FILE=graphite_gw.log
ABINIT_KSS_FILE=grapho_DS2_KSS
ABINIT_SCR_FILE=grapho_DS3_SCR
DP_KSS_FILE=graphite.kss
DP_SCR_FILE=graphite.scr
DP_IN_FILE=graphite_exc.in
DP_OUT_FILE=graphite_exc.out

run_abinit ()
{
    mpdboot -v -r ssh -f NODE -n 1 > /dev/null
    printf "Running ABINIT on $ABINIT_IN_FILE.\n"
    cd abinit/
    mpiexec -np 12 -env I_MPI_DEVICE rdssm  abinip < $ABINIT_IN_FILE > $ABINIT_LOG_FILE
    rm -f *_LOG_* fort.*
    mkdir -p out/
    mv *_DS* out/
    #mv out/grapho_DS1_KSS .
    #mv out/grapho_DS1_SCR .
    mpdallexit
    printf "\tDone.\n"
    cd $CONTROL_DIR
}

# run_dp ()
# {
#     cd dp/
#     case_directory
#     ln -sf $CONTROL_DIR/abinit/out/$ABINIT_KSS_FILE $DP_KSS_FILE
#     ln -sf $CONTROL_DIR/abinit/out/$ABINIT_SCR_FILE $DP_SCR_FILE
#     ulimit -S -s unlimited
#     export OMP_STACKSIZE=4G
#     export OMP_NUM_THREADS=12
#     printf "Running DP with produced KSS file.\n"
#     dp-5.3.99-openmp -i $DP_IN_FILE -k $DP_KSS_FILE -s $DP_SCR_FILE > $DP_OUT_FILE
#     rm gmon.out mem* tree*
#     mkdir -p out/
#     mv out.* out/
#     mv *.mdf $OUTPUT_DIRECTORY
#     printf "\tDone.\n"
#     cd $CONTROL_DIR
# }

case_directory ()
{
if [[ -n "$DP_OUTPUT_DIR" ]]; then
    CURRENT_CASE=$DP_OUTPUT_DIR
    OUTPUT_DIRECTORY="res/$CURRENT_CASE/"
    mkdir -p $OUTPUT_DIRECTORY
else
    OUTPUT_DIRECTORY="res/"
fi
}

send_email ()
{
    ssh aida 'echo "your calculations have finished." | mail -s "tasks completed" sma@cio.mx'
}

if [[ "$WORKING_MODE" == "all" ]]; then
    run_abinit
    run_dp
    send_email
elif [[ "$WORKING_MODE" == "abinit" ]]; then
    run_abinit
    send_email
elif [[ "$WORKING_MODE" == "dp" ]]; then
    run_dp
    send_email
else
    printf "Usage: ./control.sh [all, abinit, dp] [optional case name]\n"
fi
