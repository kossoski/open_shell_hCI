#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_rpt2/pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 9.0,11.0 enhanced color \
    font 'Helvetica,28' linewidth 2
set output 'plot_pes_closed_rpt2.eps'
set encoding iso_8859_1

set format y "%.1f"

if (!exists("MP_LEFT"))   MP_LEFT = 0.13
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.98
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.06
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.09
if (!exists("MP_yGAP"))   MP_yGAP = 0.10

set multiplot layout 3,2 rowsfirst \
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


#set ylabel 'Energy (Hartree)'

set xrange[0.5:6.0]
set yrange[-100.30:-99.80]
set xlabel "Distance ({\305})"
set label '{/:Bold HF}' at 3.0,-99.77 tc ls 2 font 'Helvetica,34'
plot '../HF_cc-pvdz/rpt2/pes_rhf.dat'   w l ls 1 notitle, \
     '../HF_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../HF_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../HF_cc-pvdz/rpt2/pes_s0.dat'     w l ls 8 notitle, \
     '../HF_cc-pvdz/rpt2/pes_s2.dat'     w l ls 8 notitle, \
     '../HF_cc-pvdz/rpt2/pes_s4.dat'     w l ls 8 notitle, \
     '../HF_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../HF_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../HF_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../HF_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../HF_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../HF_cc-pvdz/rpt2/pes_CIo3.5.dat' w l ls 5 notitle, \
     '../HF_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle
unset ylabel
unset label

set xrange[0.95:8.0]
set yrange[-199.15:-198.6]
set xlabel "Distance ({\305})"
set label '{/:Bold F_2}' at 4.1,-198.567 tc ls 2 font 'Helvetica,34'
plot '../F2_cc-pvdz/rpt2/pes_rhf.dat'   w l ls 1 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../F2_cc-pvdz/rpt2/pes_s0.dat'     w l ls 8 notitle, \
     '../F2_cc-pvdz/rpt2/pes_s2.dat'     w l ls 8 notitle, \
     '../F2_cc-pvdz/rpt2/pes_s4.dat'     w l ls 8 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../F2_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../F2_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle
unset label

set ylabel 'Energy (Hartree)'

set xrange[1.5:16.0]
set yrange[-78.40:-77.7]
set xlabel "Distance (a_{0})"
set label '{/:Bold ethylene}' at 6.5,-77.655 tc ls 2 font 'Helvetica,34'
plot '../ethylene_cc-pvdz/rpt2/pes_rhf.dat'   w l ls 1 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_s0.dat'     w l ls 8 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_s2.dat'     w l ls 8 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_s4.dat'     w l ls 8 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../ethylene_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle
unset label
unset ylabel

#set ylabel 'Energy (Hartree)'

set xrange[0.7:4.0]
set yrange[-109.35:-108.30]
set xlabel "Distance (a_{0})"
set label '{/:Bold N_2}' at 2.2,-108.235 tc ls 2 font 'Helvetica,34'
plot '../N2_cc-pvdz/rpt2/pes_rhf.dat'   w l ls 1 notitle, \
     '../N2_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../N2_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../N2_cc-pvdz/rpt2/pes_s0.dat'     w l ls 8 notitle, \
     '../N2_cc-pvdz/rpt2/pes_s2.dat'     w l ls 8 notitle, \
     '../N2_cc-pvdz/rpt2/pes_s4.dat'     w l ls 8 notitle, \
     '../N2_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../N2_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../N2_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../N2_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../N2_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../N2_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle
unset ylabel
unset label

set xrange[1.0:10.0]
set yrange[-2.3:-1.7]
set xlabel "Distance (a_{0})"
set label '{/:Bold H_4}' at 5.0,-1.66 tc ls 2 font 'Helvetica,34'
plot '../H4_cc-pvdz/rpt2/pes_rhf.dat'   w l ls 1 notitle, \
     '../H4_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../H4_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../H4_cc-pvdz/rpt2/pes_s0.dat'     w l ls 8 notitle, \
     '../H4_cc-pvdz/rpt2/pes_s2.dat'     w l ls 8 notitle, \
     '../H4_cc-pvdz/rpt2/pes_s4.dat'     w l ls 8 notitle, \
     '../H4_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../H4_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../H4_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../H4_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../H4_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../H4_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle
unset label

set xrange[1.0:10.0]
set yrange[-4.6:-3.0]
set xlabel "Distance (a_{0})"
set label '{/:Bold H_8}' at 5.0,-2.90 tc ls 2 font 'Helvetica,34'
plot '../H8_cc-pvdz/rpt2/pes_rhf.dat'   w l ls 1 notitle, \
     '../H8_cc-pvdz/rpt2/pes_CISD.dat'   w l ls 3 notitle, \
     '../H8_cc-pvdz/rpt2/pes_CISDT.dat'  w l ls 3 notitle, \
     '../H8_cc-pvdz/rpt2/pes_s0.dat'     w l ls 8 notitle, \
     '../H8_cc-pvdz/rpt2/pes_s2.dat'     w l ls 8 notitle, \
     '../H8_cc-pvdz/rpt2/pes_s4.dat'     w l ls 8 notitle, \
     '../H8_cc-pvdz/rpt2/pes_CIo1.dat'   w l ls 4 notitle, \
     '../H8_cc-pvdz/rpt2/pes_CIo1.5.dat' w l ls 5 notitle, \
     '../H8_cc-pvdz/rpt2/pes_CIo2.dat'   w l ls 4 notitle, \
     '../H8_cc-pvdz/rpt2/pes_CIo2.5.dat' w l ls 5 notitle, \
     '../H8_cc-pvdz/rpt2/pes_CIo3.dat'   w l ls 4 notitle, \
     '../H8_cc-pvdz/rpt2/pes_fci.dat'    w l ls 2 notitle
unset label

unset ylabel
set format y ""

###################################################################################
###################################################################################

