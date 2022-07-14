This is the official implementation of the paper "LifeLonger: A Benchmark for Continual Disease Classification, MICCAI, 2022". Code will be available soon.

Please be at the root of the project:

```
mkdir data; cd data
```

According to your assigned dataset, create a new directory.
```
mkdir bloodmnist (or tissuemnist or pathmnist or organamnist)
```

Come back the root directory of the project to create a results folder pooling all of the final resutls here.
```
cd ..
mkdir resutls
```

Go to scripts folder, run following commands. Each one, run the 5 different baselines on one benchmarks. Here, we train 5 different baselines (ewc, icarl, bic, lucir, finetuning) on bloodmnist dataset. In each command, **0** shows the gpu number. You can adopt following commands for your assigned banchmarks by change the code as: bash ./script_{benchmark_name}.sh ewc 0 fixd ../resutls/benchmark_name where benchmark_name can be values in [bloodmnist, tissuemnist, pathmnist, organamnist)]
```
cd scripts
bash ./script_bloodmnist.sh ewc 0 fixd ../resutls/bloodmnist
bash ./script_bloodmnist.sh icarl 0 fixd ../resutls/bloodmnist
bash ./script_bloodmnist.sh lwf 0 fixd ../resutls/bloodmnist
bash ./script_bloodmnist.sh eeil 0 fixd ../resutls/bloodmnist
bash ./script_bloodmnist.sh mas 0 fixd ../resutls/bloodmnist
bash ./script_bloodmnist.sh finetuing 0 fixd ../resutls/bloodmnist
```

for croos domain incremental learning:
```
bash ./script_cross_domain.sh lwf 0 fixd ../resutls/cross_domain
bash ./script_cross_domain.sh ewc 0 fixd ../resutls/cross_domain
bash ./script_cross_domain.sh icarl 0 fixd ../resutls/cross_domain
```
