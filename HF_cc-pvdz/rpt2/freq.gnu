#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 5.3,5.3 enhanced color \
    font 'Helvetica,24' linewidth 2
set output 'freq.eps'
set encoding iso_8859_1

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:
#set xrange[-0.1:4.1]
#set xtics 1
# VIEW 1:
set yrange[4000:4700]
set ytics 100
mass1=1.0078250321
mass2=18.9984032
#set format y "%.2f"

set xrange[1:1e7]
set logscale x
set format x "10^{%T}"
set xtics 10**2
set mxtics 1

###################################################################################
###################################################################################

set grid xtics ytics mxtics mytics #lc rgb 'blue' lt 1, lc rgb 'red' lt 1

if (!exists("MP_LEFT"))   MP_LEFT = 0.17
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.97
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.10
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.08
if (!exists("MP_yGAP"))   MP_yGAP = 0.08

set multiplot layout 1,2 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

set style line 1 dt 1 lw 2 linecolor rgb "gray60"
set style line 2 dt 1 lw 2 linecolor rgb "black"

set style line 3  dt 1 lw 2 linecolor rgb "light-red"   pt 13 ps 2
set style line 4  dt 1 lw 2 linecolor rgb "sea-green"   pt 13 ps 2
set style line 8  dt 1 lw 2 linecolor rgb "medium-blue" pt 13 ps 2
set style line 13 dt 1 lw 2 linecolor rgb "light-red"   pt 7  ps 2
set style line 14 dt 1 lw 2 linecolor rgb "sea-green"   pt 7  ps 2
set style line 18 dt 1 lw 2 linecolor rgb "medium-blue" pt 7  ps 2

set xlabel 'Number of determinants'
set ylabel "Vibrational frequency (cm^{-1})"
#set ylabel "Force constant (Hartree/a_{0}^2)"

hartree = 4.3597447222071e-18  # joules
bohr    = 1./18897161646.321   # m
amu     = 1.6605402e-27        # kg
c       = 299792458.0          # m/s
mole    = 6.02214076e23

mu=mass1*mass2/(mass1+mass2)*amu

#fac = sqrt( (hartree/(bohr*bohr) ) / mu)/(2.0*pi*c) * 0.01
fac = sqrt(hartree/mu)/(2.0*pi*c) * 0.01 * 10**10

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

plot 'det_aD_FCI.dat'     u 2:(sqrt(2*$5)*$3*fac) w l  ls 2  notitle, \
     'det_aD_CI.dat'      u 1:(sqrt(2*$5)*$3*fac) w lp ls 3  notitle, \
     'det_aD_CIs.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 8  notitle, \
     'det_aD_CIo.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 4  notitle

unset ylabel
unset label
set format y ""

plot 'det_aD_FCI.dat'     u 2:(sqrt(2*$5)*$3*fac) w l  ls 2  notitle, \
     'det_aD_ooCI.dat'    u 1:(sqrt(2*$5)*$3*fac) w lp ls 13 notitle, \
     'det_aD_ooCIs.dat'   u 1:(sqrt(2*$5)*$3*fac) w lp ls 18 notitle, \
     'det_aD_ooCIo.dat'   u 1:(sqrt(2*$5)*$3*fac) w lp ls 14 notitle

###################################################################################
###################################################################################

#pause -1
