#!/bin/bash

norbitals=28
nelectrons=13
xcut=7.0

if [ -f "input" ]; then
  rm "input"
fi
echo "$nelectrons $norbitals" > input
../determinants/determinants_odd.x < input
rm "input"

for i in {1..6}
do
./compute_NPE.pl $i $xcut 
done
