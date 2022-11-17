
# End-to-End Chinese Speaker Identification


## Overview

This repository maintains the code and resource for the above NAACL'22 paper. Please contact yudiandoris@gmail.com if you have any questions or suggestions.

[Paper](https://aclanthology.org/2022.naacl-main.165/):
```
@inproceedings{yu-etal-2022-end,
    title = "End-to-End {C}hinese Speaker Identification",
    author = "Yu, Dian and Zhou, Ben and Yu, Dong",
    booktitle = "Proceedings of the NAACL-HLT",
    year = "2022",
    address = "Seattle, United States",
    url = "https://aclanthology.org/2022.naacl-main.165",
    pages = "2274--2285"}
```

## Data

Data files in this repository:

* ```data/CSI/{dev_v1, train_v1}.json```: extractive speaker identification (SI) instances of CSI. 
* ```data/JY/{test, dev, train}.json```: extractive SI instances of JY [1]. 
* ```data/WP2021/{test_unsplit, dev_unsplit, train_unsplit}.json```: extractive SI instances of WP2021 [2][3]. 


Please visit
[WP2021](https://github.com/chenjiaxiang/Chinese-dataset-for-speaker-identification) and 
[JY](https://github.com/huayi-dou/The-speaker-identification-corpus-of-Jin-Yong-novels) for their original data.




## Experiments

### Dependencies
tqdm, boto3, requests, nltk, tensorflow (>=1.15.0), and PyTorch (>=1.2.0)

The code has been tested with Python 3.6.

### Model Fine-Tuning

Set the file paths for the pre-trained language model [RoBERTa-wwm-ext-large](https://github.com/ymcui/Chinese-BERT-wwm) (PyTorch version) in ```run_si.sh``` and execute
	
```
bash run_si.sh
```

### Zero-Shot Evaluation

Set the paths for the pre-trained language model and the fine-tuned SI model before executing

```
bash run_zero_shot_eval.sh
```


We adopt the extractive machine reading comprehension baseline released in [CLUE](https://github.com/CLUEbenchmark/CLUE/tree/master/baselines/models_pytorch/mrc_pytorch) [4].


## Results

Due to copyright issues, we randomly masked 10% of the words in CSI. Here we report the model performance based on the masked data. We run the experiment five times using different random seeds.


#### Table 1: F1 | exact match (%) on the development set of CSI (standard deviation in parentheses).
---------------------------------------------------------------------
method | model | # of parameters |  CSI (masked version) | CSI (original version)|
| :----| :----| :----: | :----: | :----: |
| E2E_SI| <a href="https://github.com/ymcui/Chinese-BERT-wwm">RoBERTa-wwm-ext-large</a> |330M | 88.6 (0.1) \| 85.9 (0.3) | 91.0 (0.3) \| 89.5 (0.3) |
---------------------------------------------------------------------


#### Table 2: Exact match (%) on the test set of JY and WP2021 in the zero-shot setting.
---------------------------------------------------------------------
| model | training data| WP2021 | JY|
| :----|  :----:| :----: | :----: |
|E2E_SI |CSI (masked version)| 60.7  |  85.3  |
|E2E_SI |CSI (original version)| 62.1  | 88.6 |
---------------------------------------------------------------------




#### Table 3: Hyper-parameter settings for results on the masked version of CSI.

---------------------------------------------------------------------
|  | value|
| :----| :----: |
| batch size| 64 |
| learning rate| 3e-5 | 
| num of training epochs| 5 | 
---------------------------------------------------------------------


## References
1. Yuxiang Jia, Huayi Dou, Shuai Cao, and Hongying Zan. Speaker Identification and Its Application to Social Network Construction for Chinese Novels. 2021. In Proceedings of the IALP, pages 13-18
2. Jia-Xiang Chen, Zhen-Hua Ling, and Li-Rong Dai. 2019. A chinese dataset for identifying speakers in novels. In Proceedings of the INTERSPEECH, pages 1561–1565.
3. Yue Chen, Zhen-Hua Ling, and Qing-Feng Liu. 2021. A
neural-network-based approach to identifying speakers in novels. Proc. Interspeech 2021, pages 4114–4118.
4. Liang Xu, Hai Hu, Xuanwei Zhang, Lu Li, Chenjie Cao,
Yudong Li, Yechen Xu, Kai Sun, Dian Yu, Cong
Yu, Yin Tian, Qianqian Dong, Weitang Liu, Bo Shi,
Yiming Cui, Junyi Li, Jun Zeng, Rongzhao Wang,
Weijian Xie, Yanting Li, Yina Patterson, Zuoyu Tian,
Yiwen Zhang, He Zhou, Shaoweihua Liu, Zhe Zhao,
Qipeng Zhao, Cong Yue, Xinrui Zhang, Zhengliang
Yang, Kyle Richardson, and Zhenzhong Lan. 2020.
CLUE: A Chinese language understanding evaluation
benchmark. In Proceedings of the COLING, pages
4762–4772.

## Disclaimer
This is not an officially supported Tencent product.




