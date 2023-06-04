#!/bin/bash

mol='n2'

#path='/home/fabris/ongoing_projects/seniority/Manuscript'
path='/home/fabris/seniority/Manuscript'

cp plot_pes.pdf   $path/${mol}_pes.pdf
cp plot_error.pdf $path/${mol}_pes_error.pdf
cp plot_stat.pdf  $path/${mol}_pes_stat.pdf
cp plot_closeness.pdf $path/${mol}_pes_closeness.pdf
cp freq.pdf       $path/${mol}_freq.pdf
cp xe.pdf         $path/${mol}_xe.pdf
