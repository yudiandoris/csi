#!/bin/bash
export PYTHONIOENCODING=UTF-8
export BERT_DIR=roberta_wwm_ext_large # set your model dir
export INPUT_DATA=data/CSI
export OUTPUT_DIR=output



 
python run_si.py \
  --gpu_ids 0,1,2,3,4,5,6,7 \
  --train_epochs 5 \
  --n_batch 64 \
  --lr 3e-5 \
  --train_dir $INPUT_DATA/train_features_roberta512.json \
  --dev_dir1 $INPUT_DATA/dev_examples_roberta512.json \
  --dev_dir2 $INPUT_DATA/dev_features_roberta512.json \
  --train_file $INPUT_DATA/train_v1.json \
  --dev_file $INPUT_DATA/dev_v1.json \
  --bert_config_file $BERT_DIR/bert_config.json \
  --vocab_file $BERT_DIR/vocab.txt \
  --init_restore_dir $BERT_DIR/pytorch_model.bin \
  --checkpoint_dir $OUTPUT_DIR/csi_output \
  


