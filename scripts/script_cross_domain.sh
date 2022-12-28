#!/bin/bash

if [ "$1" != "" ]; then
    echo "Running approach: $1"
else
    echo "No approach has been assigned."
fi
if [ "$2" != "" ]; then
    echo "Running on gpu: $2"
else
    echo "No gpu has been assigned."
fi

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd )"
SRC_DIR="$PROJECT_DIR/src"
echo "Project dir: $PROJECT_DIR"
echo "Sources dir: $SRC_DIR"

RESULTS_DIR="$PROJECT_DIR/results"
if [ "$4" != "" ]; then
    RESULTS_DIR=$4
else
    echo "No results dir is given. Default will be used."
fi
echo "Results dir: $RESULTS_DIR"

for SEED in 0 1 2 3 4
do  
  if [ "$3" = "fixd" ]; then
          PYTHONPATH=$SRC_DIR python -u $SRC_DIR/main_incremental.py --exp-name fixd_${SEED} \
                --datasets bloodmnist organamnist pathmnist tissuemnist --num-tasks 4 --network resnet18 --seed $SEED \
                --nepochs 200 --batch-size 32 --results-path $RESULTS_DIR \
                --approach $1 --gpu $2 \
                --num-exemplars 200 --exemplar-selection herding --lr 0.001
    
  elif [ "$3" = "grow" ]; then
            PYTHONPATH=$SRC_DIR python -u $SRC_DIR/main_incremental.py --exp-name fixd_${SEED} \
                 --datasets bloodmnist organamnist pathmnist tissuemnist --num-tasks 4 --network resnet18 --seed $SEED \
                 --nepochs 200 --batch-size 32 --results-path $RESULTS_DIR \
                 --approach $1 --gpu $2 \
                 --num-exemplars-per-class 20 --exemplar-selection herding --lr 0.001
  else
          echo "No scenario provided."
  fi
done
