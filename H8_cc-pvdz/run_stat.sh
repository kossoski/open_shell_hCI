#!/bin/bash

norbitals=40
nelectrons=8
xcut=10.0

if [ -f "input" ]; then
  rm "input"
fi
echo "$nelectrons $norbitals" > input
../determinants/determinants.x < input
rm "input"

for i in {1..6}
do
./compute_NPE.pl $i $xcut 
done
