#!/bin/sh
source activate dvd
cd /home/luchenyu/dvd
pwd

net=cap_hist_early
phase=train
config=configs/cap_hist_early_fusion_disc_train.yaml

now=$(date +"%Y%m%d_%H%M%S")

exp_dir=exps/${net}_${phase}_$now

mkdir $exp_dir
cp scripts/cap_hist_early_fusion_disc_train.sh train.py ${config} ${exp_dir}

CUDA_VISIBLE_DEVICES=2,3,4 python -m torch.distributed.launch --nproc_per_node=3 train.py --config=${config} --datetime=$now --exp_dir=$exp_dir
