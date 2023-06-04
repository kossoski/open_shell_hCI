#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'

set terminal postscript eps size 5.3,3.0 enhanced color \
    font 'Helvetica,16' linewidth 2
set output 'plot_pes.eps'

xmin=1.5
xmax=16.0
ymin=-78.36
ymax=-77.8

#set xrange[0.95:6.0]
set xrange[1.5:16.0]
# VIEW 1:
set yrange[-78.36:-77.8]
# VIEW 2:
#set yrange[-199.11:-198.90]

set style line 1 dt 1 lw 2 linecolor rgb "gray"
set style line 2 dt 1 lw 2 linecolor rgb "black"
set style line 3 dt 1 lw 2 linecolor rgb "light-red"
set style line 4 dt 1 lw 2 linecolor rgb "sea-green"
set style line 5 dt 2 lw 2 linecolor rgb "sea-green"
set style line 6 dt 1 lw 2 linecolor rgb "orange"
set style line 7 dt 2 lw 2 linecolor rgb "orange"

set style line 13 dt 1 lw 2 linecolor rgb "red"
set style line 14 dt 1 lw 2 linecolor rgb "forest-green"
set style line 15 dt 2 lw 2 linecolor rgb "forest-green"

set xlabel "Distance (a_{0})"
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

fit [1.6:2.0] [*:*] f(x) 'pes_rhf.dat' u 1:($2) via a,b
#set label 1 'RHF' at 1.8,-198.60 rotate by r(a) center tc ls 1 #font 'Verdana,20'

fit [5.0:7.0] [*:*] f(x) 'pes_e2.dat' u 1:($2) via a,b
set label 2 'CISD' at 5.0,-198.91 rotate by r(a) center tc ls 3 #font 'Verdana,20'
fit [5.0:7.0] [*:*] f(x) 'pes_e3.dat' u 1:($2) via a,b
set label 3 'CISDT' at 5.0,-198.95  rotate by r(a) center tc ls 3 #font 'Verdana,20'
fit [5.0:7.0] [*:*] f(x) 'pes_e4.dat' u 1:($2) via a,b
set label 4 'CISDTQ' at 5.0,-199.037  rotate by r(a) center tc ls 3 #font 'Verdana,20'

fit [7.0:9.0] [*:*] f(x) 'pes_CIo2.dat' u 1:($2) via a,b
set label 12 'CIo2' at 7.0,-198.923  rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [7.0:9.0] [*:*] f(x) 'pes_CIo3.dat' u 1:($2) via a,b
set label 13 'CIo3' at 7.0,-199.037 rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [7.0:9.0] [*:*] f(x) 'pes_CIo4.dat' u 1:($2) via a,b
set label 14 'CIo4' at 7.0,-199.062 rotate by r(a) center tc ls 4 #font 'Verdana,20'
fit [7.0:9.0] [*:*] f(x) 'pes_fci.dat' u 1:($2) via a,b
set label 20 'FCI' at 9.0,-199.062 rotate by r(a) center tc ls 2 #font 'Verdana,20'


plot 'pes_rhf.dat'   w l ls 1 notitle, \
     'pes_e2.dat' w l ls 3 notitle, \
     'pes_e3.dat' w l ls 3 notitle, \
     'pes_e4.dat' w l ls 3 notitle, \
     'pes_CIo1.dat'   w l ls 5 notitle, \
     'pes_CIo1.5.dat' w l ls 5 notitle, \
     'pes_CIo2.dat'   w l ls 4 notitle, \
     'pes_CIo2.5.dat' w l ls 5 notitle, \
     'pes_CIo3.dat'   w l ls 4 notitle, \
     'pes_CIo3.5.dat' w l ls 5 notitle, \
     'pes_CIo4.dat'   w l ls 4 notitle, \
     'pes_ooCIe2.dat' w l ls 13 notitle, \
     'pes_ooCIo1.dat'   w l ls 15 notitle, \
     'pes_fci.dat'   w l ls 2 notitle
#    'pes_ooCISD.dat' w l ls 13 notitle, \
#    'pes_ooCIo1.dat' w l ls 15 notitle, \
#    'pes_ooCIo2.dat' w l ls 14 notitle, \
#    'pes_ooCIo1.5.dat' w l ls 15 notitle, \
#    'pes_pccd.dat'  w l ls 6 notitle, \
#    'pes_ccsd.dat'  w l ls 6 notitle, \
#    'pes_ccsdt.dat'  w l ls 6 notitle, \
#    'pes_s0.e2.dat' w l ls 1 notitle, \
#    'pes_s2.e2.dat' w l ls 1 notitle, \
#    'pes_s2.e3.dat' w l ls 1 notitle, \
#    'pes_s4.e3.dat' w l ls 1 notitle, \
#    'pes_s0.e4.dat' w l ls 1 notitle, \
#    'pes_s2.e4.dat' w l ls 1 notitle, \
#    'pes_s4.e4.dat' w l ls 1 notitle, \

#pause -1
