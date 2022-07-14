# Experiment Scripts 
In order to facilitate reproducibility of the experiments in
_**LifeLonger: A Benchmark for Continual Disease
Classification**_ ([arxiv](https://arxiv.org/pdf/2204.05737.pdf)),
scripts for the main experiments are provided. Their main usage is as follows: 

```bash
./script_cifar100.sh <approach> <gpu> <scenario> [<results_dir>]
```

where: 
    
* `<approach>` - approach to be used, from the ones in `./src/approaches/`
* `<gpu>` - index of GPU to run the experiment on
* `<scenario>` - specific rehearsal scenario (base: no exemplars, fixd: fixed memory, grow: growing memory)
* `[<results_dir>]` - results directory (optional), by default it will be `./results`
