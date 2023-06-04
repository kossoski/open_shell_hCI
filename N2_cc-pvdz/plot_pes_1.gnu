#!/bin/gnuplot

#set terminal pngcairo size 1200,800 enhanced font 'Verdana,18'
#set output 'plot_pes.png'

set terminal postscript eps size 5.3,3.0 enhanced color \
    font 'Helvetica,18' linewidth 2
set output 'plot_pes.eps'

xmin=0.7
xmax=4.0
ymin=-109.30
ymax=-108.30

set xrange[0.7:4.0]
#set yrange[-109.30:-108.60]
set yrange[-109.30:-108.30]
# ZOOM:
#set xrange[0.95:1.35]
#set yrange[-109.29:-109.20]

set style line 1 dt 1 lw 2 linecolor rgb "gray"
set style line 2 dt 1 lw 2 linecolor rgb "black"
set style line 3 dt 1 lw 2 linecolor rgb "light-red"
set style line 4 dt 1 lw 2 linecolor rgb "sea-green"
set style line 5 dt 2 lw 2 linecolor rgb "sea-green"
set style line 13 dt 1 lw 3 linecolor rgb "light-red"
set style line 14 dt 1 lw 3 linecolor rgb "sea-green"
set style line 15 dt 2 lw 3 linecolor rgb "sea-green"
set style line 6 dt 1 lw 2 linecolor rgb "orange"
set style line 7 dt 2 lw 2 linecolor rgb "orange"

set xlabel 'Distance (angstrom)'
set ylabel 'Energy (Hartree)'

# get the relation of x- and y-range
dx = xmax-xmin
dy = ymax-ymin
s1 = dx/dy
# get ratio of axes
s2 = 3.0/5.3
# helper function for getting the rotation angle of the labels in degree
deg(x) = x/pi*180.0
r(x) = deg(atan(s1*s2*x))
# function for fitting
f(x) = a*x+b

fit [1.7:1.8] [*:*] f(x) 'pes_rhf.dat' u 1:($2) via a,b
set label 1 'RHF' at 1.75,-108.42 rotate by r(a) center tc ls 1 #font 'Verdana,20'
fit [2.9:3.1] [*:*] f(x) 'pes_s4.e2.dat' u 1:($2) via a,b
set label 2 'CISD' at 3.0,-108.53 rotate by r(a) center tc ls 3 #font 'Verdana,20'
fit [2.9:3.1] [*:*] f(x) 'pes_s6.e3.dat' u 1:($2) via a,b
set label 3 'CISDT' at 3.0,-108.595 rotate by r(a) center tc ls 3 #font 'Verdana,20'
fit [2.9:3.1] [*:*] f(x) 'pes_s8.e4.dat' u 1:($2) via a,b
set label 4 'CISDTQ' at 3.0,-108.840 rotate by r(a) center tc ls 3 #font 'Verdana,20'

fit [3.6:3.8] [*:*] f(x) 'pes_CIo2.dat' u 1:($2) via a,b
set label 12 'CIo2' at 3.7,-108.625 rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [3.6:3.8] [*:*] f(x) 'pes_CIo3.dat' u 1:($2) via a,b
set label 13 'CIo3' at 3.7,-108.830 rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [3.0:4.0] [*:*] f(x) 'pes_CIo4.dat' u 1:($2) via a,b
set label 14 'CIo4' at 3.7,-108.920 rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [3.0:4.0] [*:*] f(x) 'pes_fci.dat' u 1:($2) via a,b
set label 20 'FCI' at 3.7,-108.980 rotate by r(a) center tc ls 2 #font 'Verdana,20'


plot 'pes_rhf.dat'   w l ls 1 notitle, \
     'pes_s4.e2.dat' w l ls 3 notitle, \
     'pes_s6.e3.dat' w l ls 3 notitle, \
     'pes_s8.e4.dat' w l ls 3 notitle, \
     'pes_CIo1.dat'   w l ls 5 notitle, \
     'pes_CIo1.5.dat' w l ls 5 notitle, \
     'pes_CIo2.dat'   w l ls 4 notitle, \
     'pes_CIo2.5.dat' w l ls 5 notitle, \
     'pes_CIo3.dat'   w l ls 4 notitle, \
     'pes_CIo3.5.dat' w l ls 5 notitle, \
     'pes_CIo4.dat'   w l ls 4 notitle, \
     'pes_ooCIo1.dat' w l ls 2 notitle, \
     'pes_fci.dat'   w l ls 2 notitle
#    'pes_pccd.dat'  w l ls 6 notitle, \
#    'pes_ccsd.dat'  w l ls 6 notitle, \
#    'pes_ccsd_t.dat' w l ls 6 notitle, \
#    'pes_ooCIo2.dat'  w l ls 2 notitle, \
#    'pes_ooCISD.dat'  w l ls 2 notitle, \
#    'pes_s10.e5.dat' w l ls 3 notitle, \
#    'pes_CIo4.5.dat' w l ls 5 notitle, \
#    'pes_CIo5.dat'   w l ls 4 notitle, \
#    'pes_s0.e2.dat' w l ls 1 notitle, \
#    'pes_s2.e2.dat' w l ls 1 notitle, \
#    'pes_s2.e3.dat' w l ls 1 notitle, \
#    'pes_s4.e3.dat' w l ls 1 notitle, \
#    'pes_s0.e4.dat' w l ls 1 notitle, \
#    'pes_s2.e4.dat' w l ls 1 notitle, \
#    'pes_s4.e4.dat' w l ls 1 notitle, \
#    'pes_s2.e5.dat' w l ls 1 notitle, \
#    'pes_s4.e5.dat' w l ls 1 notitle, \
#    'pes_s6.e5.dat' w l ls 1 notitle, \
#    'pes_s8.e5.dat' w l ls 1 notitle, \
#    'pes_s0.e6.dat' w l ls 1 notitle, \
#    'pes_s2.e6.dat' w l ls 1 notitle, \
#    'pes_s4.e6.dat' w l ls 1 notitle, \
#    'pes_s6.e6.dat' w l ls 1 notitle, \
#    'pes_s8.e6.dat' w l ls 1 notitle, \
#    'pes_s10.e6.dat' w l ls 1 notitle, \

#pause -1
