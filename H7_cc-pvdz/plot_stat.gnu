#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
set terminal postscript eps size 5.3,5.3 enhanced color \
    font 'Helvetica,24' linewidth 2
set output 'plot_stat.eps'


###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:
#set xrange[-0.1:4.1]
set yrange[0.0:1.0]
#set logscale y
#set format y "10^{%T}"

set xrange[1:1e9]
set logscale x
set format x "10^{%T}"

###################################################################################
###################################################################################

set xtics 10**3
set mxtics 1

set grid xtics ytics mxtics mytics #lc rgb 'blue' lt 1, lc rgb 'red' lt 1

if (!exists("MP_LEFT"))   MP_LEFT = 0.17
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.97
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.10
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.08
if (!exists("MP_yGAP"))   MP_yGAP = 0.08

set multiplot layout 1,2 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

set style line 3  dt 1 lw 2 linecolor rgb "light-red"   pt 13 ps 2
set style line 4  dt 1 lw 2 linecolor rgb "sea-green"   pt 13 ps 2
set style line 8  dt 1 lw 2 linecolor rgb "medium-blue" pt 13 ps 2
set style line 13 dt 1 lw 2 linecolor rgb "light-red"   pt 7  ps 2
set style line 14 dt 1 lw 2 linecolor rgb "sea-green"   pt 7  ps 2
set style line 18 dt 1 lw 2 linecolor rgb "medium-blue" pt 7  ps 2


#set xlabel 'Computational scaling'
set xlabel 'Number of determinants'
set ylabel 'Non-parallelity error (Hartree)'

plot 'stat_CI.dat'   u ($3):($4)  w lp ls 3  notitle, \
     'stat_CIs.dat'  u ($3):($4)  w lp ls 8  notitle, \
     'stat_CIo.dat'  u ($3):($4)  w lp ls 4  notitle
#plot 'stat_CI.dat'   u 1:($2)  w lp ls 3  notitle, \
#     'stat_CIo.dat'  u 1:($2)  w lp ls 4  notitle

unset ylabel
unset label
set format y ""

plot 'stat_ooCI.dat'   u ($3):($4)  w lp ls 13  notitle, \
     'stat_ooCIs.dat'  u ($3):($4)  w lp ls 18  notitle, \
     'stat_ooCIo.dat'  u ($3):($4)  w lp ls 14  notitle
#plot 'stat_ooCI.dat'   u 1:($2)  w lp ls 13  notitle, \
#     'stat_ooCIo.dat'  u 1:($2)  w lp ls 14  notitle
