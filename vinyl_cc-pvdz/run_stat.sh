#!/bin/bash

norbitals=43
nelec_alpha=8
nelec_beta=7
xcut=9.0

if [ -f "input" ]; then
  rm "input"
fi
echo "$nelec_alpha $nelec_beta $norbitals" > input
../determinants/determinants.x < input
rm "input"

for i in {1..6}
do
./compute_NPE.pl $i $xcut
done
