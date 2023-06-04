#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
set terminal postscript eps size 5.3,5.3 enhanced color \
    font 'Helvetica,24' linewidth 2
set output 'plot.eps'

set format y "10^{%T}"

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

#r=1.45 angs
efci=-199.10042765

set xrange[-0.1:4.1]
set yrange[1e-3:1]

###################################################################################
###################################################################################

set xtics 1
set mxtics 2
set logscale y

set grid xtics ytics mxtics mytics #lc rgb 'blue' lt 1, lc rgb 'red' lt 1

if (!exists("MP_LEFT"))   MP_LEFT = 0.13
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.98
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.10
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.08
if (!exists("MP_yGAP"))   MP_yGAP = 0.08

set multiplot layout 1,2 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

set style line 3 dt 1 lw 2 linecolor rgb "light-red" pt 13 ps 2
set style line 4 dt 1 lw 2 linecolor rgb "sea-green" pt 13 ps 2
set style line 13 dt 1 lw 2 linecolor rgb "light-red" pt 7 ps 2
set style line 14 dt 1 lw 2 linecolor rgb "sea-green" pt 7 ps 2

set xlabel 'Computational scaling'
set ylabel 'Energy error (Hartree)'

plot 'r1.45_ciexc.dat'   u 1:($2-efci)  w lp ls 3  notitle, \
     'r1.45_cio.dat'     u 1:($2-efci)  w lp ls 4  notitle

unset ylabel
#unset ytics
unset label

plot 'r1.45_oociexc.dat' u 1:($2-efci)  w lp ls 13 notitle, \
     'r1.45_oocio.dat'   u 1:($2-efci)  w lp ls 14 notitle
