#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 5.3,5.3 enhanced color \
    font 'Helvetica,24' linewidth 2
set output 'plot_pes.eps'
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
set yrange[-199.11:-198.6]
ymin=-199.11
ymax=-198.6
###################################################################################
###################################################################################

set format y "%.1f"

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


if (!exists("MP_LEFT"))   MP_LEFT = 0.19
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.97
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.10
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.05
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
set style line 8 dt 1 lw 3 linecolor rgb "medium-blue"

set xlabel "Distance ({\305})"
set ylabel 'Energy (Hartree)'

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

fit [1.6:2.0] [*:*] f(x) 'pes_rhf.dat' u 1:($2) via a,b
set label 1 'RHF' at 1.9,-198.675 rotate by r(a) center tc ls 1 #font 'Verdana,20'
fit [3.0:5.0] [*:*] f(x) 'pes_s0.dat' u 1:($2) via a,b
set label 31 'sCI0' at 3.0,-198.771 rotate by r(a) center tc ls 8 #font 'Verdana,20'
fit [3.0:5.0] [*:*] f(x) 'pes_s2.dat' u 1:($2) via a,b
set label 32 'sCI2' at 3.0,-198.796 rotate by r(a) center tc ls 8 #font 'Verdana,20'
fit [3.0:5.0] [*:*] f(x) 'pes_s4.dat' u 1:($2) via a,b
set label 33 'sCI4' at 3.0,-199.033 rotate by r(a) center tc ls 8 #font 'Verdana,20'
fit [4.0:6.0] [*:*] f(x) 'pes_CISD.dat' u 1:($2) via a,b
set label 2 'CISD' at 5.0,-198.906 rotate by r(a) center tc ls 3 #font 'Verdana,20'
fit [4.0:6.0] [*:*] f(x) 'pes_CISDT.dat' u 1:($2) via a,b
set label 3 'CISDT' at 5.0,-198.946  rotate by r(a) center tc ls 3 #font 'Verdana,20'
fit [6.0:8.0] [*:*] f(x) 'pes_CIo1.dat' u 1:($2) via a,b
set label 11 'hCI1' at 7.0,-198.738  rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [6.0:8.0] [*:*] f(x) 'pes_CIo2.dat' u 1:($2) via a,b
set label 12 'hCI2' at 7.0,-198.938  rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [6.0:8.0] [*:*] f(x) 'pes_CIo3.dat' u 1:($2) via a,b
set label 13 'hCI3' at 7.0,-199.033 rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [6.0:8.0] [*:*] f(x) 'pes_fci.dat' u 1:($2) via a,b
set label 20 'FCI' at 7.0,-199.067 rotate by r(a) center tc ls 2 #font 'Verdana,20'

plot 'pes_rhf.dat'    w l ls 1 notitle, \
     'pes_CISD.dat'   w l ls 3 notitle, \
     'pes_CISDT.dat'  w l ls 3 notitle, \
     'pes_CISDTQ.dat' w l ls 3 notitle, \
     'pes_s0.dat'     w l ls 8 notitle, \
     'pes_s2.dat'     w l ls 8 notitle, \
     'pes_s4.dat'     w l ls 8 notitle, \
     'pes_CIo1.dat'   w l ls 4 notitle, \
     'pes_CIo1.5.dat' w l ls 5 notitle, \
     'pes_CIo2.dat'   w l ls 4 notitle, \
     'pes_CIo2.5.dat' w l ls 5 notitle, \
     'pes_CIo3.dat'   w l ls 4 notitle, \
     'pes_fci.dat'    w l ls 2 notitle

unset label
unset ylabel
set format y ""

a=0; b=0

fit [1.6:2.0] [*:*] f(x) 'pes_rhf.dat' u 1:($2) via a,b
set label 21 'RHF' at 1.9,-198.675 rotate by r(a) center tc ls 1 #font 'Verdana,20'
fit [3.5:4.5] [*:*] f(x) 'pes_ooCIs0.dat' u 1:($2) via a,b
set label 41 'oo-sCI0' at 3.5,-198.784 rotate by r(a) center tc ls 8 #font 'Verdana,20'
fit [4.5:5.5] [*:*] f(x) 'pes_ooCIS.dat' u 1:($2) via a,b
set label 20 'oo-CIS' at 5.0,-198.735 rotate by r(a) center tc ls 3 #font 'Verdana,20'
fit [4.5:5.5] [*:*] f(x) 'pes_ooCISD.dat' u 1:($2) via a,b
set label 22 'oo-CISD' at 5.0,-198.907 rotate by r(a) center tc ls 3 #font 'Verdana,20'
fit [6.0:8.0] [*:*] f(x) 'pes_ooCIo1.dat' u 1:($2) via a,b
set label 31 'oo-hCI1' at 6.5,-198.805  rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [6.0:8.0] [*:*] f(x) 'pes_ooCIo2.dat' u 1:($2) via a,b
set label 32 'oo-hCI2' at 6.5,-198.976  rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [6.0:8.0] [*:*] f(x) 'pes_fci.dat' u 1:($2) via a,b
set label 30 'FCI' at 7.0,-199.067 rotate by r(a) center tc ls 2 #font 'Verdana,20'

plot 'pes_rhf.dat'      w l ls 1 notitle, \
     'pes_ooCIS.dat'    w l ls 3 notitle, \
     'pes_ooCISD.dat'   w l ls 3 notitle, \
     'pes_ooCIs0.dat'   w l ls 8 notitle, \
     'pes_ooCIs2.dat'   w l ls 8 notitle, \
     'pes_ooCIo1.dat'   w l ls 4 notitle, \
     'pes_ooCIo1.5.dat' w l ls 5 notitle, \
     'pes_ooCIo2.dat'   w l ls 4 notitle, \
     'pes_ooCIo2.5.dat' w l ls 5 notitle, \
     'pes_ooCIo3.dat'   w l ls 4 notitle, \
     'pes_fci.dat'      w l ls 2 notitle

###################################################################################
###################################################################################

