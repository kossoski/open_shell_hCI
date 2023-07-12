#!/bin/bash

norbitals=26
nelectrons=10
xcut=4.0

if [ -f "input" ]; then
  rm "input"
fi
echo "$nelectrons $norbitals" > input
../../determinants/determinants.x < input
rm "input"

for i in {1..6}
do
./compute_NPE.pl $i $xcut 
done
