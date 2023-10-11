#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 7.0,5.0 enhanced color \
    font 'Helvetica,28' linewidth 2
set output 'plot_pes_f2.eps'
set encoding iso_8859_1

if (!exists("MP_LEFT"))   MP_LEFT = 0.16
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.98
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.12
if (!exists("MP_TOP"))    MP_TOP = 0.96
if (!exists("MP_xGAP"))   MP_xGAP = 0.02
if (!exists("MP_yGAP"))   MP_yGAP = 0.12

set multiplot layout 1,2 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

rgb(r,g,b) = 65536 * int(r) + 256 * int(g) + int(b)

set style line 1 dt 1 pt 6 lw 4 linecolor rgb "gray60"
set style line 2 dt 6 pt 6 lw 4 linecolor rgb "black"
#set style line 3 dt 1 pt 6 lw 4 linecolor rgb "light-red"
set style line 3 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(206,24,30)
#set style line 4 dt 1 pt 6 lw 4 linecolor rgb "sea-green"
set style line 4 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(0,147,83)
set style line 5 dt 2 pt 6 lw 4 linecolor rgbcolor rgb(0,147,83)
set style line 6 dt 1 pt 6 lw 4 linecolor rgb "orange"
set style line 7 dt 2 pt 6 lw 4 linecolor rgb "orange"
#set style line 8 dt 1 pt 6 lw 4 linecolor rgb "medium-blue"
set style line 8 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(28,54,135)

set style line 30 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(243,123,112)
set style line 40 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(101,194,149)
set style line 50 dt 2 pt 6 lw 4 linecolor rgbcolor rgb(101,194,149)
set style line 80 dt 1 pt 6 lw 4 linecolor rgbcolor rgb( 94,138,199)

set xlabel "Distance (a_{0})"
set ylabel 'Energy (Hartree)'

###################################################################################
###################################################################################

set xrange[1.00:4.5]
set yrange[-199.15:-198.6]
#set yrange[-199.15:-198.9]
set xtics 1.0
set ytics 0.1
set format y "%.1f"
set xlabel "Distance ({\305})"
#set label '{/:Bold F2}' at 4.0,-75.180 tc ls 2 font 'Helvetica,34'

set label 01 '{/:Bold RHF}'      at 1.4, -198.70  tc ls 1 font 'Helvetica,28'
set label 10 '{/:Bold hCI1}'     at 3.3, -198.735 tc ls 4 font 'Helvetica,28'
set label 15 '{/:Bold hCI1+EN2}' at 3.3, -199.03 tc ls 40 font 'Helvetica,28'
set label 40 '{/:Bold FCI}'      at 3.3, -199.075 tc ls 2 font 'Helvetica,28'

plot '../F2_cc-pvdz/pes_rhf.dat'   w l ls 1 notitle, \
     '../F2_cc-pvdz/pes_CIo1.dat'   w l ls 4 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 40 notitle, \
     '../F2_cc-pvdz/pes_fci.dat'    w l ls 2 notitle

unset ylabel

unset label 10
unset label 15

set label 20 '{/:Bold CISD}'     at 3.3, -198.90 tc ls 3 font 'Helvetica,28'
set label 10 '{/:Bold hCI2}'     at 3.3, -198.95 tc ls 4 font 'Helvetica,28'
set label 25 '{/:Bold CISD+EN2}' at 2.0, -199.02 tc ls 30 font 'Helvetica,28'
set label 15 '{/:Bold hCI2+EN2}' at 3.3, -199.02 tc ls 40 font 'Helvetica,28'
set format y ""

plot '../F2_cc-pvdz/pes_rhf.dat'   w l ls 1 notitle, \
     '../F2_cc-pvdz/pes_CISD.dat'   w l ls 3 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 40 notitle, \
     '../F2_cc-pvdz/pes_CIo2.dat'   w l ls 4 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 30 notitle, \
     '../F2_cc-pvdz/pes_fci.dat'    w l ls 2 notitle

#plot '../F2_cc-pvdz/pes_rhf.dat'   w l ls 1 notitle, \
#     '../F2_cc-pvdz/pes_CISDT.dat'   w l ls 3 notitle, \
#     '../F2_cc-pvdz/rpt2/pes_CISDT.dat'   w l ls 30 notitle, \
#     '../F2_cc-pvdz/pes_CIo3.dat'   w l ls 4 notitle, \
#     '../F2_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 40 notitle, \
#     '../F2_cc-pvdz/pes_fci.dat'    w l ls 2 notitle

unset label

###################################################################################
###################################################################################

