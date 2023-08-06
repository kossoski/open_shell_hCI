#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 10.0,10.0 enhanced color \
    font 'Helvetica,34' linewidth 2
set output 'plot_pt2_rpt2_ethylene.eps'
set encoding iso_8859_1

if (!exists("MP_LEFT"))   MP_LEFT = 0.13
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.98
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.08
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.12
if (!exists("MP_yGAP"))   MP_yGAP = 0.09

set multiplot layout 2,2 rowsfirst \
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

set style line 300 dt 2 pt 9 lw 4 ps 2.5 linecolor rgbcolor rgb(243,123,112)
set style line 400 dt 2 pt 9 lw 4 ps 2.5 linecolor rgbcolor rgb(101,194,149)
set style line 800 dt 2 pt 9 lw 4 ps 2.5 linecolor rgbcolor rgb( 94,138,199)

# LINE 2
set logscale x
set format x "10^{%T}"
set format y "%.1f"
set ytics 0.1
set xtics 10**2
set mxtics 1
#set grid xtics ytics mxtics mytics 
#set xlabel 'Number of determinants'
set xlabel 'N_{det}'
#set ylabel 'Non-parallelity error (Hartree)'
set ylabel 'NPE (Hartree)'

###################################################################################
set xrange[1:1e11]
set yrange[0.0:0.30]

set label '{/:Bold EN2}' at 100000,0.34 tc ls 2 font 'Helvetica,44'
plot 'pt2/stat_CIs.dat'  u ($3):($4)  w lp ls 80  notitle, \
     'pt2/stat_CI.dat'   u ($3):($4)  w lp ls 30  notitle, \
     'pt2/stat_CIo.dat'  u ($3):($4)  w lp ls 40  notitle, \
     'rpt2/stat_CIs.dat'  u ($3):($4)  w lp ls 800  notitle, \
     'rpt2/stat_CI.dat'   u ($3):($4)  w lp ls 300  notitle, \
     'rpt2/stat_CIo.dat'  u ($3):($4)  w lp ls 400  notitle
unset label
unset ylabel
set format y "%.1f"
###################################################################################


# LINE 3
set ylabel 'Distance error (Hartree)'
set format y "%.1f"
set ytics 0.1

###################################################################################
set yrange[0.0:0.3]

plot 'pt2/stat_CIs.dat'  u ($3):($5)  w lp ls 80  notitle, \
     'pt2/stat_CI.dat'   u ($3):($5)  w lp ls 30  notitle, \
     'pt2/stat_CIo.dat'  u ($3):($5)  w lp ls 40  notitle, \
     'rpt2/stat_CIs.dat'  u ($3):($5)  w lp ls 800  notitle, \
     'rpt2/stat_CI.dat'   u ($3):($5)  w lp ls 300  notitle, \
     'rpt2/stat_CIo.dat'  u ($3):($5)  w lp ls 400  notitle
unset ylabel
###################################################################################
set format y "%.1f"


# LINE 4
#set xlabel 'Number of determinants'

###################################################################################
set ylabel "Equilibrium distance ({\305})"
set yrange[1.33:1.36]
set ytics 0.01
set format y "%.2f"
bohr    = 1./1.8897161646321

plot 'pt2/det_xe_FCI.dat'     u 2:($3*bohr) w l  ls 2  notitle, \
     'pt2/det_xe_CIs.dat'     u 1:($3*bohr) w lp ls 80  notitle, \
     'pt2/det_xe_CI.dat'      u 1:($3*bohr) w lp ls 30  notitle, \
     'pt2/det_xe_CIo.dat'     u 1:($3*bohr) w lp ls 40  notitle, \
     'rpt2/det_xe_CIs.dat'     u 1:($3*bohr) w lp ls 800  notitle, \
     'rpt2/det_xe_CI.dat'      u 1:($3*bohr) w lp ls 300  notitle, \
     'rpt2/det_xe_CIo.dat'     u 1:($3*bohr) w lp ls 400  notitle
unset ylabel
###################################################################################


# LINE 5
#set xlabel 'Number of determinants'
set ylabel "Vibrational frequency (cm^{-1})"

hartree = 4.3597447222071e-18  # joules
bohr    = 1./18897161646.321   # m
amu     = 1.6605402e-27        # kg
c       = 299792458.0          # m/s
mole    = 6.02214076e23

###################################################################################
set yrange[1490:1560]
set ytics 20
set format y "%.0f"
mass1=14.0156500642
mass2=14.0156500642

mu=mass1*mass2/(mass1+mass2)*amu
fac = sqrt(hartree/mu)/(2.0*pi*c) * 0.01 / bohr
#fac = sqrt( (hartree/(bohr*bohr) ) / mu)/(2.0*pi*c) * 0.01
#fac = sqrt(hartree/mu)/(2.0*pi*c) * 0.01 * 10**10

plot 'pt2/det_aD_FCI.dat'     u 2:(sqrt(2*$5)*$3*fac) w l  ls 2  notitle, \
     'pt2/det_aD_CIs.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 80  notitle, \
     'pt2/det_aD_CI.dat'      u 1:(sqrt(2*$5)*$3*fac) w lp ls 30  notitle, \
     'pt2/det_aD_CIo.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 40  notitle, \
     'rpt2/det_aD_CIs.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 800  notitle, \
     'rpt2/det_aD_CI.dat'      u 1:(sqrt(2*$5)*$3*fac) w lp ls 300  notitle, \
     'rpt2/det_aD_CIo.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 400  notitle
unset ylabel
###################################################################################

unset label
unset ylabel
set format y ""

