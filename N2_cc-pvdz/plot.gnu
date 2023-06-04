#!/bin/gnuplot

#r=1.1 angs

efci=-109.27724761

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
set terminal postscript eps size 5.3,3.0 enhanced color \
    font 'Helvetica,18' linewidth 2
set output 'plot.eps'

xmin=-0.1
xmax=3.5
ymin=0.0
ymax=1.0

set grid

#set format y "%.0e*10^{%T}"
set format y "10^{%T}"

#set xrange[-0.1:3.1]
set xrange[-0.1:5.1]
#set yrange[0.0:0.2]

set logscale y
set yrange[1e-5:1]
#set yrange[1e-4:1.0]

#set xrange[1.9:3.1]
#set yrange[0.0:0.006]

set style line 1 dt 1 lw 1 linecolor rgb "gray60"    pt 13 ps 1.75
set style line 3 dt 1 lw 1 linecolor rgb "light-red" pt 13 ps  1.75
set style line 4 dt 1 lw 1 linecolor rgb "sea-green" pt 13 ps  1.75
set style line 5 dt 2 lw 1 linecolor rgb "sea-green" pt 13 ps  1.75

set style line 11 dt 1 lw 1.5 linecolor rgb "gray60" 
set style line 13 dt 2 lw 1.5 linecolor rgb "light-red" pt 7 ps  1.75
set style line 14 dt 2 lw 1.5 linecolor rgb "sea-green" pt 7 ps  1.75
set style line 15 dt 2 lw 1.5 linecolor rgb "sea-green" pt 7 ps  1.75

set xlabel 'Computational scaling'
set ylabel 'Energy error (Hartree)'

plot 'r1.1_ciexc.dat'   u 1:($2-efci)  w lp ls 3  notitle, \
     'r1.1_oociexc.dat' u 1:($2-efci)  w l  ls 11 notitle, \
     'r1.1_oociexc.dat' u 1:($2-efci)  w lp ls 13 notitle, \
     'r1.1_cio.dat'     u 1:($2-efci)  w lp ls 4  notitle, \
     'r1.1_oocio.dat'   u 1:($2-efci)  w l  ls 11 notitle, \
     'r1.1_oocio.dat'   u 1:($2-efci)  w lp ls 14 notitle

#pause -1
