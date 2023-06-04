#!/bin/bash

mol='hf'

path='/home/fabris/ongoing_projects/seniority/Manuscript'

cp plot_pes.pdf      $path/${mol}_pes.pdf
cp plot_error.pdf    $path/${mol}_pes_error.pdf

cp plot_stat.pdf     $path/${mol}_npe.pdf
cp plot_distance.pdf $path/${mol}_distance.pdf
cp freq.pdf          $path/${mol}_freq.pdf
cp xe.pdf            $path/${mol}_xe.pdf
