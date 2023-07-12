#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_rpt2/pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 9.0,9.0 enhanced color \
    font 'Helvetica,28' linewidth 2
set output 'plot_pes_rpt2.eps'
set encoding iso_8859_1

set format y "%.1f"

if (!exists("MP_LEFT"))   MP_LEFT = 0.13
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.98
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.07
if (!exists("MP_TOP"))    MP_TOP = 0.96
if (!exists("MP_xGAP"))   MP_xGAP = 0.09
if (!exists("MP_yGAP"))   MP_yGAP = 0.12

set multiplot layout 2,2 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

rgb(r,g,b) = 65536 * int(r) + 256 * int(g) + int(b)

set style line 1 dt 1 pt 6 lw 2 linecolor rgb "gray60"
set style line 2 dt 1 pt 6 lw 2 linecolor rgb "black"
#set style line 3 dt 1 pt 6 lw 2 linecolor rgb "light-red"
set style line 3 dt 1 pt 6 lw 2 linecolor rgbcolor rgb(206,24,30)
#set style line 4 dt 1 pt 6 lw 2 linecolor rgb "sea-green"
set style line 4 dt 1 pt 6 lw 2 linecolor rgbcolor rgb(0,147,83)
set style line 5 dt 2 pt 6 lw 2 linecolor rgb "sea-green"
set style line 6 dt 1 pt 6 lw 2 linecolor rgb "orange"
set style line 7 dt 2 pt 6 lw 2 linecolor rgb "orange"
#set style line 8 dt 1 pt 6 lw 2 linecolor rgb "medium-blue"
set style line 8 dt 1 pt 6 lw 2 linecolor rgbcolor rgb(28,54,135)

set xlabel "Distance (a_{0})"
set ylabel 'Energy (Hartree)'

###################################################################################
###################################################################################

set xrange[0.6:8.0]
set yrange[-75.6:-75.2]
set ytics 0.1
set xlabel "Distance ({\305})"
set label '{/:Bold OH}' at 4.0,-75.180 tc ls 2 font 'Helvetica,34'
plot '../OH_cc-pvdz/rpt2/pes_rohf.dat'   w l ls 1 notitle, \
     '../OH_cc-pvdz/rpt2/pes_CIS.dat'    w l ls 3 notitle, \
     '../OH_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../OH_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../OH_cc-pvdz/rpt2/pes_s1.dat'     w l ls 8 notitle, \
     '../OH_cc-pvdz/rpt2/pes_s3.dat'     w l ls 8 notitle, \
     '../OH_cc-pvdz/rpt2/pes_s5.dat'     w l ls 8 notitle, \
     '../OH_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../OH_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../OH_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../OH_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../OH_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../OH_cc-pvdz/rpt2/pes_CIo3.5.dat' w l ls 5 notitle, \
     '../OH_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle

unset ylabel

set xrange[0.7:4.0]
set yrange[-92.6:-91.6]
set ytics 0.2
set xlabel "Distance ({\305})"
set label '{/:Bold CN}' at 2.2,-91.55 tc ls 2 font 'Helvetica,34'
plot '../CN_cc-pvdz/rpt2/pes_rohf.dat'   w l ls 1 notitle, \
     '../CN_cc-pvdz/rpt2/pes_CIS.dat'    w l ls 3 notitle, \
     '../CN_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../CN_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../CN_cc-pvdz/rpt2/pes_s1.dat'     w l ls 8 notitle, \
     '../CN_cc-pvdz/rpt2/pes_s3.dat'     w l ls 8 notitle, \
     '../CN_cc-pvdz/rpt2/pes_s5.dat'     w l ls 8 notitle, \
     '../CN_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../CN_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../CN_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../CN_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../CN_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../CN_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle

set ylabel 'Energy (Hartree)'

set xrange[1.7:9.0]
set yrange[-77.7:-77.0]
set ytics 0.1
set xlabel "Distance (a_{0})"
set label '{/:Bold vinyl}' at 4.8,-76.960 tc ls 2 font 'Helvetica,34'
plot '../vinyl_cc-pvdz/rpt2/pes_rohf.dat'   w l ls 1 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_CIS.dat'    w l ls 3 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_s1.dat'     w l ls 8 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_s3.dat'     w l ls 8 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_s5.dat'     w l ls 8 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../vinyl_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle
unset ylabel

set xrange[1.0:10.0]
set yrange[-4.0:-2.9]
set ytics 0.2
set xlabel "Distance (a_{0})"
set label '{/:Bold H_7}' at 5.2,-2.843 tc ls 2 font 'Helvetica,34'
plot '../H7_cc-pvdz/rpt2/pes_rohf.dat'   w l ls 1 notitle, \
     '../H7_cc-pvdz/rpt2/pes_CIS.dat'    w l ls 3 notitle, \
     '../H7_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../H7_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../H7_cc-pvdz/rpt2/pes_s1.dat'     w l ls 8 notitle, \
     '../H7_cc-pvdz/rpt2/pes_s3.dat'     w l ls 8 notitle, \
     '../H7_cc-pvdz/rpt2/pes_s5.dat'     w l ls 8 notitle, \
     '../H7_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../H7_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../H7_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../H7_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../H7_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../H7_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle

unset label
unset ylabel
set format y ""

###################################################################################
###################################################################################

