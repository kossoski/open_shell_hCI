#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 18.0,6.0 enhanced color \
    font 'Helvetica,34' linewidth 2
set output 'plot_f2_rpt2.eps'
set encoding iso_8859_1

if (!exists("MP_LEFT"))   MP_LEFT = 0.06
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.99
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.13
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.07
if (!exists("MP_yGAP"))   MP_yGAP = 0.01

set multiplot layout 1,4 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

rgb(r,g,b) = 65536 * int(r) + 256 * int(g) + int(b)

set style line 1 dt 1 pt 7 lw 4 linecolor rgb "gray60"
set style line 2 dt 6 pt 7 lw 4 linecolor rgb "black"
#set style line 3 dt 1 pt 7 lw 3 linecolor rgb "light-red"
set style line 3 dt 1 pt 7 lw 4 ps 2.5 linecolor rgbcolor rgb(206,24,30)
#set style line 4 dt 1 pt 7 lw 3 linecolor rgb "sea-green"
set style line 4 dt 1 pt 7 lw 4 ps 2.5 linecolor rgbcolor rgb(0,147,83)
set style line 5 dt 2 pt 7 lw 4 linecolor rgb "sea-green"
set style line 6 dt 1 pt 7 lw 4 linecolor rgb "orange"
set style line 7 dt 2 pt 7 lw 4 linecolor rgb "orange"
#set style line 8 dt 1 pt 7 lw 3 linecolor rgb "medium-blue"
set style line 8 dt 1 pt 7 lw 4 ps 2.5 linecolor rgbcolor rgb(28,54,135)

set style line 30 dt 1 pt 7 lw 4 ps 2.5 linecolor rgbcolor rgb(243,123,112)
set style line 40 dt 1 pt 7 lw 4 ps 2.5 linecolor rgbcolor rgb(101,194,149)
set style line 80 dt 1 pt 7 lw 4 ps 2.5 linecolor rgbcolor rgb( 94,138,199)

# LINE 2
set logscale x
set format x "10^{%T}"
set format y "%.1f"
set ytics 0.1
set xtics 10**3
set mxtics 1
#set grid xtics ytics mxtics mytics 
set xlabel 'Number of determinants'
set ylabel 'Non-parallelity error (Hartree)'

###################################################################################
set yrange[0:0.13]
set xrange[1:1e10]
set format y "%.2f"
set ytics 0.02
set ylabel 'Non-parallelity error (Hartree)'

plot '../F2_cc-pvdz/stat_CIs.dat'  u ($3):($4)  w lp ls 8  notitle, \
     '../F2_cc-pvdz/rpt2/stat_CIs.dat'  u ($3):($4)  w lp ls 80  notitle, \
     '../F2_cc-pvdz/stat_CI.dat'   u ($3):($4)  w lp ls 3  notitle, \
     '../F2_cc-pvdz/stat_CIo.dat'  u ($3):($4)  w lp ls 4  notitle, \
     '../F2_cc-pvdz/rpt2/stat_CI.dat'   u ($3):($4)  w lp ls 30  notitle, \
     '../F2_cc-pvdz/rpt2/stat_CIo.dat'  u ($3):($4)  w lp ls 40  notitle
unset label
###################################################################################


###################################################################################
set xrange[1:1e10]
set yrange[0.0:0.7]
set ytics 0.2
set format y "%.1f"
set ylabel 'Distance error (Hartree)'

#set label '{/:Bold F_2}' at 0.006,0.81 tc ls 2 font 'Helvetica,44'
plot '../F2_cc-pvdz/stat_CIs.dat'  u ($3):($5)  w lp ls 8  notitle, \
     '../F2_cc-pvdz/rpt2/stat_CIs.dat'  u ($3):($5)  w lp ls 80  notitle, \
     '../F2_cc-pvdz/stat_CI.dat'   u ($3):($5)  w lp ls 3  notitle, \
     '../F2_cc-pvdz/stat_CIo.dat'  u ($3):($5)  w lp ls 4  notitle, \
     '../F2_cc-pvdz/rpt2/stat_CI.dat'   u ($3):($5)  w lp ls 30  notitle, \
     '../F2_cc-pvdz/rpt2/stat_CIo.dat'  u ($3):($5)  w lp ls 40  notitle
###################################################################################


###################################################################################
set xrange[1:1e10]
set yrange[1.34:1.50]
set format y "%.2f"
set ytics 0.02
set ylabel "Equilibrium distance ({\305})"

plot '../F2_cc-pvdz/det_xe_FCI.dat'     u 2:3 w l  ls 2  notitle, \
     '../F2_cc-pvdz/det_xe_CIs.dat'     u 1:3 w lp ls 8  notitle, \
     '../F2_cc-pvdz/rpt2/det_xe_CIs.dat'     u 1:3 w lp ls 80  notitle, \
     '../F2_cc-pvdz/det_xe_CI.dat'      u 1:3 w lp ls 3  notitle, \
     '../F2_cc-pvdz/det_xe_CIo.dat'     u 1:3 w lp ls 4  notitle, \
     '../F2_cc-pvdz/rpt2/det_xe_CI.dat'      u 1:3 w lp ls 30  notitle, \
     '../F2_cc-pvdz/rpt2/det_xe_CIo.dat'     u 1:3 w lp ls 40  notitle
###################################################################################

hartree = 4.3597447222071e-18  # joules
bohr    = 1./18897161646.321   # m
amu     = 1.6605402e-27        # kg
c       = 299792458.0          # m/s
mole    = 6.02214076e23

###################################################################################
set xrange[1:1e10]
set yrange[600:1200]
set ylabel "Vibrational frequency (cm^{-1})"
set format y "%.0f"
set ytics 100
mass1=18.9984032
mass2=18.9984032
mu=mass1*mass2/(mass1+mass2)*amu
#fac = sqrt( (hartree/(bohr*bohr) ) / mu)/(2.0*pi*c) * 0.01
fac = sqrt(hartree/mu)/(2.0*pi*c) * 0.01 * 10**10

plot '../F2_cc-pvdz/det_aD_FCI.dat'     u 2:(sqrt(2*$5)*$3*fac) w l  ls 2  notitle, \
     '../F2_cc-pvdz/det_aD_CIs.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 8  notitle, \
     '../F2_cc-pvdz/rpt2/det_aD_CIs.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 80  notitle, \
     '../F2_cc-pvdz/det_aD_CI.dat'      u 1:(sqrt(2*$5)*$3*fac) w lp ls 3  notitle, \
     '../F2_cc-pvdz/det_aD_CIo.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 4  notitle, \
     '../F2_cc-pvdz/rpt2/det_aD_CI.dat'      u 1:(sqrt(2*$5)*$3*fac) w lp ls 30  notitle, \
     '../F2_cc-pvdz/rpt2/det_aD_CIo.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 40  notitle
###################################################################################

unset label
unset ylabel
set format y ""

