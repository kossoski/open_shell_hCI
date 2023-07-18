#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 9.0,6.0 enhanced color \
    font 'Helvetica,28' linewidth 2
set output 'plot_error_f2.eps'
set encoding iso_8859_1


if (!exists("MP_LEFT"))   MP_LEFT = 0.12
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.98
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.11
if (!exists("MP_TOP"))    MP_TOP = 0.96
if (!exists("MP_xGAP"))   MP_xGAP = 0.07
if (!exists("MP_yGAP"))   MP_yGAP = 0.12

set multiplot layout 1,3 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

rgb(r,g,b) = 65536 * int(r) + 256 * int(g) + int(b)

set style line 1 dt 1 pt 6 lw 2 linecolor rgb "gray60"
set style line 1 dt 2 pt 6 lw 2 linecolor rgb "black"
#set style line 3 dt 1 pt 6 lw 2 linecolor rgb "light-red"
set style line 3 dt 1 pt 6 lw 2 linecolor rgbcolor rgb(206,24,30)
#set style line 4 dt 1 pt 6 lw 2 linecolor rgb "sea-green"
set style line 4 dt 1 pt 6 lw 2 linecolor rgbcolor rgb(0,147,83)
set style line 5 dt 2 pt 6 lw 2 linecolor rgbcolor rgb(0,147,83)
set style line 6 dt 1 pt 6 lw 2 linecolor rgb "orange"
set style line 7 dt 2 pt 6 lw 2 linecolor rgb "orange"
#set style line 8 dt 1 pt 6 lw 2 linecolor rgb "medium-blue"
set style line 8 dt 1 pt 6 lw 2 linecolor rgbcolor rgb(28,54,135)

set style line 30 dt 1 pt 6 lw 2 linecolor rgbcolor rgb(243,123,112)
set style line 40 dt 1 pt 6 lw 2 linecolor rgbcolor rgb(101,194,149)
set style line 50 dt 2 pt 6 lw 2 linecolor rgbcolor rgb(101,194,149)
set style line 80 dt 1 pt 6 lw 2 linecolor rgbcolor rgb( 94,138,199)

set xlabel "Distance (a_{0})"
set ylabel 'Energy (Hartree)'

###################################################################################
###################################################################################

set xrange[0.95:8.0]
set yrange[-0.05:0.35]
set xtics 1.0
set ytics 0.05
set format y "%.2f"
set xlabel "Distance ({\305})"
#set label '{/:Bold F2}' at 4.0,-75.180 tc ls 2 font 'Helvetica,34'

plot '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/pes_rhf.dat'   using 1:($4-$2) w l ls 1 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/pes_CIo1.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/rpt2/pes_CIo1.dat'   using 1:($4-$2) w l ls 40 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/pes_fci.dat'    using 1:($4-$2) w l ls 2 notitle

unset ylabel
#set yrange[-0.02:0.16]
#set ytics 0.02
#set format y "%.2f"
#set format y ""

plot '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/pes_CISD.dat'   using 1:($4-$2) w l ls 3 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/rpt2/pes_CISD.dat'   using 1:($4-$2) w l ls 30 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/pes_CIo2.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/rpt2/pes_CIo2.dat'   using 1:($4-$2) w l ls 40 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/pes_fci.dat'    using 1:($4-$2) w l ls 2 notitle

plot '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/pes_CISDT.dat'  using 1:($4-$2) w l ls 3 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/rpt2/pes_CISDT.dat'  using 1:($4-$2) w l ls 30 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/pes_CIo3.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/rpt2/pes_CIo3.dat'   using 1:($4-$2) w l ls 40 notitle, \
     '< paste ../F2_cc-pvdz/pes_fci.dat ../F2_cc-pvdz/pes_fci.dat'    using 1:($4-$2) w l ls 2 notitle

unset label

###################################################################################
###################################################################################

