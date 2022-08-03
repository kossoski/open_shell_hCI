#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 5.3,5.3 enhanced color \
    font 'Helvetica,24' linewidth 2
set output 'xe.eps'
set encoding iso_8859_1

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:
set xrange[1:1e9]
set logscale x
set format x "10^{%T}"
set xtics 10**3
set mxtics 1

# VIEW 1:
set yrange[0.95:0.99]
set format y "%.2f"
set ytics 0.01
###################################################################################
###################################################################################

set grid xtics ytics mxtics mytics #lc rgb 'blue' lt 1, lc rgb 'red' lt 1

if (!exists("MP_LEFT"))   MP_LEFT = 0.17
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.97
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.10
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.08
if (!exists("MP_yGAP"))   MP_yGAP = 0.08

set multiplot layout 1,2 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

set style line 1 dt 1 lw 2 linecolor rgb "gray60"
set style line 2 dt 1 lw 2 linecolor rgb "black"

set style line 3  dt 1 lw 2 linecolor rgb "light-red"   pt 13 ps 2
set style line 4  dt 1 lw 2 linecolor rgb "sea-green"   pt 13 ps 2
set style line 8  dt 1 lw 2 linecolor rgb "medium-blue" pt 13 ps 2
set style line 13 dt 1 lw 2 linecolor rgb "light-red"   pt 7  ps 2
set style line 14 dt 1 lw 2 linecolor rgb "sea-green"   pt 7  ps 2
set style line 18 dt 1 lw 2 linecolor rgb "medium-blue" pt 7  ps 2

set xlabel 'Number of determinants'
set ylabel "Equilibrium distance ({\305})"

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

plot 'det_xe_FCI.dat'     u 2:3 w l  ls 2  notitle, \
     'det_xe_CI.dat'      u 1:3 w lp ls 3  notitle, \
     'det_xe_CIs.dat'     u 1:3 w lp ls 8  notitle, \
     'det_xe_CIo.dat'     u 1:3 w lp ls 4  notitle#, \
#    'xe_ooCI.dat'    w lp ls 13 notitle, \
#    'xe_ooCIo.dat'   w lp ls 14 notitle

unset ylabel
unset label
set format y ""

plot 'det_xe_FCI.dat'     u 2:3 w l  ls 2  notitle, \
     'det_xe_ooCI.dat'    u 1:3 w lp ls 13 notitle, \
     'det_xe_ooCIs.dat'   u 1:3 w lp ls 18 notitle, \
     'det_xe_ooCIo.dat'   u 1:3 w lp ls 14 notitle

###################################################################################
###################################################################################

#pause -1
