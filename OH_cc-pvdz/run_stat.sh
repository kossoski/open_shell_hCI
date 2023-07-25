#!/bin/bash

norbitals=19
nelec_alpha=5
nelec_beta=4
xcut=8.0

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
