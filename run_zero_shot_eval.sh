#!/bin/bash
export PYTHONIOENCODING=UTF-8
export BERT_DIR=roberta_wwm_ext_large # set your model dir
export OUTPUT_DIR=output

  

export INPUT_DATA=data/JY
export MRC_DIR=output/csi_output/epoch5_batch64_lr3e-05_warmup0.1_anslen50/checkpoint_score_f1-88.797_em-86.1.pth  # set your fine-tuned model path

python run_si.py \
  --gpu_ids 0,1,2,3,4,5,6,7 \
  --n_batch 64 \
  --train_dir $INPUT_DATA/train_features_roberta512.json \
  --dev_dir1 $INPUT_DATA/dev_examples_roberta512.json \
  --dev_dir2 $INPUT_DATA/dev_features_roberta512.json \
  --train_file $INPUT_DATA/train.json \
  --dev_file $INPUT_DATA/test.json \
  --bert_config_file $BERT_DIR/bert_config.json \
  --vocab_file $BERT_DIR/vocab.txt \
  --init_restore_dir $MRC_DIR \
  --checkpoint_dir $OUTPUT_DIR/book_jy_test_csi_masked_zero \
  --eval_only True \



rm $INPUT_DATA/dev_features_roberta512.json
rm $INPUT_DATA/dev_examples_roberta512.json



export INPUT_DATA=data/WP2021

python run_si.py \
  --gpu_ids 1,2,3,4,5,6,7 \
  --n_batch 64 \
  --train_dir $INPUT_DATA/train_features_roberta512.json \
  --dev_dir1 $INPUT_DATA/dev_examples_roberta512.json \
  --dev_dir2 $INPUT_DATA/dev_features_roberta512.json \
  --train_file $INPUT_DATA/train_unsplit.json \
  --dev_file $INPUT_DATA/test_unsplit.json \
  --bert_config_file $BERT_DIR/bert_config.json \
  --vocab_file $BERT_DIR/vocab.txt \
  --init_restore_dir $MRC_DIR \
  --checkpoint_dir $OUTPUT_DIR/book_wp2021_test_csi_masked_zero \
  --eval_only True \


rm $INPUT_DATA/dev_features_roberta512.json
rm $INPUT_DATA/dev_examples_roberta512.json