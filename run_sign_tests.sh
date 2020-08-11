#!/bin/bash

[ -f ./path.sh ] && . ./path.sh

if [ $# -le 2 ]; then
  echo "Usage: $0 ref-text hyp-text-1 hyp-text-2 ... hyp-text-N"
  echo "Performs significance tests using the transcript (ref-text) and the decoder outputs (hyp-text-*)"
  echo "All text files must be in trn format"
  echo "Example line from a trn file:  my favourite sport is volleyball and judo @em @voice and @m @ns  (1010103_en_22_20_102)"
  exit 1;
fi

ref="$1"
shift
files=""
for var in "${@}"
do
   #run sclite
   sclite -i swb -r ${ref}  -h ${var} -o sgml
   files="$files ${var}.sgml"
done
cat ${files} | sc_stats -p -t std4 -v -u -n significance_report
