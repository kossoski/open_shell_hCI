#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 5.3,5.3 enhanced color \
    font 'Helvetica,24' linewidth 2
set output 'force.eps'
set encoding iso_8859_1

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:
set xrange[-0.1:4.1]

# VIEW 1:
set yrange[2.10:2.90]
set format y "%.2f"
###################################################################################
###################################################################################

set xtics 1
set ytics 0.1

set grid xtics ytics mxtics mytics #lc rgb 'blue' lt 1, lc rgb 'red' lt 1

if (!exists("MP_LEFT"))   MP_LEFT = 0.15
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.98
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.10
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.08
if (!exists("MP_yGAP"))   MP_yGAP = 0.08

set multiplot layout 1,2 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

set style line 1 dt 1 lw 3 linecolor rgb "gray60"
set style line 2 dt 1 lw 3 linecolor rgb "black"

set style line 3  dt 1 lw 3 linecolor rgb "light-red" pt 13 ps 2
set style line 4  dt 1 lw 3 linecolor rgb "sea-green" pt 13 ps 2
set style line 13 dt 1 lw 2 linecolor rgb "light-red" pt 7  ps 2
set style line 14 dt 1 lw 2 linecolor rgb "sea-green" pt 7  ps 2

set xlabel 'Computational scaling'
set ylabel "Force constant (Hartree/{\305}^{2})"

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

plot 'aD_FCI.dat'     u 1:(2*$2*$2*$4) w l  ls 2  notitle, \
     'aD_CI.dat'      u 1:(2*$2*$2*$4) w lp ls 3  notitle, \
     'aD_CIo.dat'     u 1:(2*$2*$2*$4) w lp ls 4  notitle

unset ylabel
unset label
set format y ""

plot 'aD_FCI.dat'     u 1:(2*$2*$2*$4) w l  ls 2  notitle, \
     'aD_ooCI.dat'    u 1:(2*$2*$2*$4) w lp ls 13 notitle, \
     'aD_ooCIo.dat'   u 1:(2*$2*$2*$4) w lp ls 14 notitle

###################################################################################
###################################################################################

#pause -1
