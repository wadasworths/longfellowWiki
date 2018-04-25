### run.sh



#### thchs-30_data_prep.sh脚本
```
local/thchs-30_data_prep.sh $H $thchs/data_thchs30 || exit 1;
```

数据准备脚本：thchs-30_data_prep.sh

需要生成：text, wav.scp, utt2pk, spk2utt等文件

在data/ 目录下生成：word.txt（词序列），phone.txt（音素序列），text（与word.txt相同），wav.scp（语音），utt2pk（句子与说话人的映射），spk2utt（说话人与句子的映射）

#### make_mfcc.sh脚本
```
#提取MFCC特征
steps/make_mfcc.sh --nj $n --cmd "$train_cmd" data/mfcc/$x exp/make_mfcc/$x mfcc/$x || exit 1;
#计算倒谱均值和方差归一化
steps/compute_cmvn_stats.sh data/mfcc/$x exp/mfcc_cmvn/$x mfcc/$x || exit 1;
```
