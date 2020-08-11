# ASR-significance-test

A script to perform significance tests on the outputs of ASR models.

##Inputs
Only the reference transcription and the models' textual outputs are needed. The texts need to be in **trn** format, more info [here](http://my.fit.edu/~vkepuska/ece5527/sctk-2.3-rc1/doc/infmts.htm#trn_fmt_name_0)

##Usage
`run_significance.sh ref-text hyp-text-1 hyp-text-2 ... hyp-text-N`
the first parameter is the filename of the transcript. After that, a list of files can be given, which will be compared.
**Important:** the script uses `sclite` and `sc_stat`, these files must be accesible, if you use Kaldi run `path.sh` befor this script.

##Output
The script will produce several output files, which start with the prefix significance_report. The most important one is the **significance_report.stats.unified** that summarizes all the tests.
