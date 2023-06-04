#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 5.3,5.3 enhanced color \
    font 'Helvetica,44' linewidth 2
set output 'plot_pes_hCI.eps'
set encoding iso_8859_1

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

set xrange[0.95:8.0]
xmin=0.95
xmax=8.0

# VIEW 1:
#set yrange[-199.11:-198.90]
# VIEW 2:
set yrange[-199.15:-198.3]
ymin=-199.11
ymax=-198.6
###################################################################################
###################################################################################

unset xtics
unset ytics
set format x ""
set format y ""

# get the relation of x- and y-range
dx = xmax-xmin
dy = ymax-ymin
s1 = dx/dy
# get ratio of axes
#s2 = 3.0/5.3
s2 = 5.3/5.3*2
# helper function for getting the rotation angle of the labels in degree
deg(x) = x/pi*180.0
r(x) = deg(atan(s1*s2*x))
# function for fitting
f(x) = a*x+b


if (!exists("MP_LEFT"))   MP_LEFT = 0.09
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.97
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.09
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.05
if (!exists("MP_yGAP"))   MP_yGAP = 0.08

set multiplot layout 1,1 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

set style line 1 dt 1 lw 5 linecolor rgb "gray60"
set style line 2 dt 1 lw 5 linecolor rgb "black"
set style line 3 dt 1 lw 5 linecolor rgb "light-red"
set style line 4 dt 1 lw 5 linecolor rgb "sea-green"
set style line 5 dt 2 lw 5 linecolor rgb "sea-green"
set style line 6 dt 1 lw 5 linecolor rgb "orange"
set style line 7 dt 2 lw 5 linecolor rgb "orange"
set style line 8 dt 1 lw 5 linecolor rgb "medium-blue"

#set xlabel "Distance ({\305})"
#set ylabel 'Energy (Hartree)'
set xlabel "Distance"
set ylabel 'Energy'

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

a=0
#fit [7.5:8.0] [*:*] f(x) 'pes_rhf.dat' u 1:($2) via a,b
set label 1 'RHF' at 7.0,-198.364 rotate by r(a) center tc ls 1 #font 'Verdana,20'
#fit [3.0:5.0] [*:*] f(x) 'pes_s0.dat' u 1:($2) via a,b
#set label 31 'sCI0' at 3.0,-198.771 rotate by r(a) center tc ls 8 #font 'Verdana,20'
#fit [3.0:5.0] [*:*] f(x) 'pes_s2.dat' u 1:($2) via a,b
#set label 32 'sCI2' at 3.0,-198.796 rotate by r(a) center tc ls 8 #font 'Verdana,20'
#fit [3.0:5.0] [*:*] f(x) 'pes_s4.dat' u 1:($2) via a,b
#set label 33 'sCI4' at 3.0,-199.033 rotate by r(a) center tc ls 8 #font 'Verdana,20'
#fit [6.0:6.0] [*:*] f(x) 'pes_CISD.dat' u 1:($2) via a,b
#set label 2 'CISD' at 5.0,-198.906 rotate by r(a) center tc ls 3 #font 'Verdana,20'
#fit [4.0:6.0] [*:*] f(x) 'pes_CISDT.dat' u 1:($2) via a,b
#set label 3 'CISDT' at 5.0,-198.946  rotate by r(a) center tc ls 3 #font 'Verdana,20'
#fit [6.0:8.0] [*:*] f(x) 'pes_CIo1.dat' u 1:($2) via a,b
set label 11 'hCI1' at 7.0,-198.720  rotate by r(a) center tc ls 4 #font 'Verdana,20'
#fit [6.0:8.0] [*:*] f(x) 'pes_CIo2.dat' u 1:($2) via a,b
set label 12 'hCI2' at 7.0,-198.900  rotate by r(a) center tc ls 4 #font 'Verdana,20'
#fit [6.0:8.0] [*:*] f(x) 'pes_CIo3.dat' u 1:($2) via a,b
set label 13 'hCI3' at 7.0,-199.015 rotate by r(a) center tc ls 4 #font 'Verdana,20'
#fit [6.0:8.0] [*:*] f(x) 'pes_fci.dat' u 1:($2) via a,b
set label 20 'FCI' at 7.0,-199.090 rotate by r(a) center tc ls 2 #font 'Verdana,20'

plot 'pes_rhf.dat'    w l ls 1 notitle, \
     'pes_CIo1.dat'   w l ls 4 notitle, \
     'pes_CIo2.dat'   w l ls 4 notitle, \
     'pes_CIo3.dat'   w l ls 4 notitle, \
     'pes_fci.dat'    w l ls 2 notitle
#    'pes_CIo1.5.dat' w l ls 5 notitle, \
#    'pes_CIo2.5.dat' w l ls 5 notitle, \
#    'pes_CISD.dat'   w l ls 3 notitle, \
#    'pes_CISDT.dat'  w l ls 3 notitle, \
#    'pes_CISDTQ.dat' w l ls 3 notitle, \
#    'pes_s0.dat'     w l ls 8 notitle, \
#    'pes_s2.dat'     w l ls 8 notitle, \
#    'pes_s4.dat'     w l ls 8 notitle, \
