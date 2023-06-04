#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_error.png'

set terminal postscript eps size 5.3,5.3 enhanced color \
    font 'Helvetica,24' linewidth 2
#set output 'plot_error.eps'
set encoding iso_8859_1

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

xmin=0.95
xmax=8.0
#set xrange[0.95:5.0]
set xrange[0.95:8.0]

ymin=1.0e-3
ymax=1.0
# VIEW 1
#set logscale y
#set yrange[1.0e-3:1.0]
# VIEW 2
set yrange[0.0:0.35]
# VIEW 3
#set yrange[0.0:0.15]
# VIEW 4
#set yrange[0.0:0.02]

###################################################################################
###################################################################################

set format y "%.2f"

if (!exists("MP_LEFT"))   MP_LEFT = 0.15
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.98
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.10
if (!exists("MP_TOP"))    MP_TOP = 0.98
if (!exists("MP_xGAP"))   MP_xGAP = 0.06
if (!exists("MP_yGAP"))   MP_yGAP = 0.08

set multiplot layout 1,2 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

set style line 1 dt 1 lw 3 linecolor rgb "gray60"
set style line 2 dt 1 lw 3 linecolor rgb "black"
set style line 3 dt 1 lw 3 linecolor rgb "light-red"
set style line 4 dt 1 lw 3 linecolor rgb "sea-green"
set style line 5 dt 2 lw 3 linecolor rgb "sea-green"
set style line 6 dt 1 lw 3 linecolor rgb "orange"
set style line 7 dt 2 lw 3 linecolor rgb "orange"

set xlabel "Distance ({\305})"
set ylabel 'Energy error (Hartree)'

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

#stats "< paste pes_fci.dat pes_rhf.dat" u 1:($4-$2) nooutput
stats "< paste pes_fci.dat pes_rhf.dat" #u ($4-$2) nooutput

print  STATS_OUTOFRANGE_x
print  STATS_RECORDS_x
print  STATS_MIN_y
print  STATS_MAX_y

###################################################################################
###################################################################################
