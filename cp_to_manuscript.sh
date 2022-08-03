#!/bin/bash

path='Manuscript'

molecules=( OH CN H7 vinyl )

for mol in "${molecules[@]}"
do

cp ${mol}_cc-pvdz/plot_pes.pdf      $path/${mol}_pes.pdf
cp ${mol}_cc-pvdz/plot_error.pdf    $path/${mol}_pes_error.pdf
cp ${mol}_cc-pvdz/plot_stat.pdf     $path/${mol}_npe.pdf
cp ${mol}_cc-pvdz/plot_distance.pdf $path/${mol}_distance.pdf
cp ${mol}_cc-pvdz/freq.pdf          $path/${mol}_freq.pdf
cp ${mol}_cc-pvdz/force.pdf         $path/${mol}_force.pdf
cp ${mol}_cc-pvdz/xe.pdf            $path/${mol}_xe.pdf

done 
