#!/bin/bash

norbitals=35
nelectrons=7
xcut=10.0

if [ -f "input" ]; then
  rm "input"
fi
echo "$nelectrons $norbitals" > input
../../determinants/determinants_odd.x < input
rm "input"

for i in {1..6}
do
./compute_NPE.pl $i $xcut 
done
