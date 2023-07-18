#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

set terminal postscript eps size 27.0,18.0 enhanced color \
    font 'Helvetica,34' linewidth 2
set output 'plot_all_closed.eps'
set encoding iso_8859_1

if (!exists("MP_LEFT"))   MP_LEFT = 0.055
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.98
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.05
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.045
if (!exists("MP_yGAP"))   MP_yGAP = 0.06

set multiplot layout 4,6 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

rgb(r,g,b) = 65536 * int(r) + 256 * int(g) + int(b)

set style line 1 dt 1 pt 6 lw 3 linecolor rgb "gray60"
set style line 2 dt 1 pt 6 lw 3 linecolor rgb "black"
#set style line 3 dt 1 pt 6 lw 3 linecolor rgb "light-red"
set style line 3 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(206,24,30)
#set style line 4 dt 1 pt 6 lw 3 linecolor rgb "sea-green"
set style line 4 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(0,147,83)
set style line 5 dt 2 pt 6 lw 3 linecolor rgb "sea-green"
set style line 6 dt 1 pt 6 lw 3 linecolor rgb "orange"
set style line 7 dt 2 pt 6 lw 3 linecolor rgb "orange"
#set style line 8 dt 1 pt 6 lw 3 linecolor rgb "medium-blue"
set style line 8 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(28,54,135)

set style line 30 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(243,123,112)
set style line 40 dt 1 pt 6 lw 4 linecolor rgbcolor rgb(101,194,149)
set style line 80 dt 1 pt 6 lw 4 linecolor rgbcolor rgb( 94,138,199)

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
set yrange[0:0.3]
set xrange[1:1e7]
set ytics 0.10

set label '{/:Bold HF}' at 2000,0.32 tc ls 2 font 'Helvetica,44'
plot '../HF_cc-pvdz/stat_CIs.dat'  u ($3):($4)  w lp ls 8  notitle, \
     '../HF_cc-pvdz/stat_CI.dat'   u ($3):($4)  w lp ls 3  notitle, \
     '../HF_cc-pvdz/stat_CIo.dat'  u ($3):($4)  w lp ls 4  notitle
unset label
###################################################################################

#unset ylabel

###################################################################################
set yrange[0:0.5]
set xrange[1:1e10]
set ytics 0.10

set label '{/:Bold F_2}' at 20000,0.54 tc ls 2 font 'Helvetica,44'
plot '../F2_cc-pvdz/stat_CIs.dat'  u ($3):($4)  w lp ls 8  notitle, \
     '../F2_cc-pvdz/stat_CI.dat'   u ($3):($4)  w lp ls 3  notitle, \
     '../F2_cc-pvdz/stat_CIo.dat'  u ($3):($4)  w lp ls 4  notitle
unset label
###################################################################################

###################################################################################
set yrange[0:0.6]
set xrange[1:1e11]

set label '{/:Bold ethylene}' at 2000,0.65 tc ls 2 font 'Helvetica,44'
plot '../ethylene_cc-pvdz/stat_CIs.dat'  u ($3):($4)  w lp ls 8  notitle, \
     '../ethylene_cc-pvdz/stat_CI.dat'   u ($3):($4)  w lp ls 3  notitle, \
     '../ethylene_cc-pvdz/stat_CIo.dat'  u ($3):($4)  w lp ls 4  notitle
unset label
###################################################################################

###################################################################################
set yrange[0:1]
set xrange[1:1e9]
set ytics 0.20

set label '{/:Bold N_2}' at 20000,1.08 tc ls 2 font 'Helvetica,44'
plot '../N2_cc-pvdz/stat_CIs.dat'  u ($3):($4)  w lp ls 8  notitle, \
     '../N2_cc-pvdz/stat_CI.dat'   u ($3):($4)  w lp ls 3  notitle, \
     '../N2_cc-pvdz/stat_CIo.dat'  u ($3):($4)  w lp ls 4  notitle
unset label
###################################################################################

###################################################################################
set yrange[0:0.5]
set xrange[1:1e5]
set xtics 10**2
set ytics 0.10

set label '{/:Bold H_4}' at 200,0.54 tc ls 2 font 'Helvetica,44'
plot '../H4_cc-pvdz/stat_CIs.dat'  u ($3):($4)  w lp ls 8  notitle, \
     '../H4_cc-pvdz/stat_CI.dat'   u ($3):($4)  w lp ls 3  notitle, \
     '../H4_cc-pvdz/stat_CIo.dat'  u ($3):($4)  w lp ls 4  notitle
unset label
set xtics 10**3
###################################################################################

###################################################################################
set yrange[0:1]
set xrange[1:1e9]
set ytics 0.20

set label '{/:Bold H_8}' at 20000,1.08 tc ls 2 font 'Helvetica,44'
plot '../H8_cc-pvdz/stat_CIs.dat'  u ($3):($4)  w lp ls 8  notitle, \
     '../H8_cc-pvdz/stat_CI.dat'   u ($3):($4)  w lp ls 3  notitle, \
     '../H8_cc-pvdz/stat_CIo.dat'  u ($3):($4)  w lp ls 4  notitle
unset label
###################################################################################

# LINE 3
set ylabel 'Distance error (Hartree)'
set format y "%.1f"
set ytics 0.2

###################################################################################
set xrange[1:1e7]
set yrange[0.0:0.7]

plot '../HF_cc-pvdz/stat_CIs.dat'  u ($3):($5)  w lp ls 8  notitle, \
     '../HF_cc-pvdz/stat_CI.dat'   u ($3):($5)  w lp ls 3  notitle, \
     '../HF_cc-pvdz/stat_CIo.dat'  u ($3):($5)  w lp ls 4  notitle
###################################################################################

#unset ylabel

###################################################################################
set xrange[1:1e10]
set yrange[0.0:1.1]
set ytics 0.2

plot '../F2_cc-pvdz/stat_CIs.dat'  u ($3):($5)  w lp ls 8  notitle, \
     '../F2_cc-pvdz/stat_CI.dat'   u ($3):($5)  w lp ls 3  notitle, \
     '../F2_cc-pvdz/stat_CIo.dat'  u ($3):($5)  w lp ls 4  notitle
###################################################################################

###################################################################################
set xrange[1:1e11]
set yrange[0.0:1.1]

plot '../ethylene_cc-pvdz/stat_CIs.dat'  u ($3):($5)  w lp ls 8  notitle, \
     '../ethylene_cc-pvdz/stat_CI.dat'   u ($3):($5)  w lp ls 3  notitle, \
     '../ethylene_cc-pvdz/stat_CIo.dat'  u ($3):($5)  w lp ls 4  notitle
###################################################################################

###################################################################################
set xrange[1:1e9]
set yrange[0.0:1.4]

plot '../N2_cc-pvdz/stat_CIs.dat'  u ($3):($5)  w lp ls 8  notitle, \
     '../N2_cc-pvdz/stat_CI.dat'   u ($3):($5)  w lp ls 3  notitle, \
     '../N2_cc-pvdz/stat_CIo.dat'  u ($3):($5)  w lp ls 4  notitle
###################################################################################


###################################################################################
set xrange[1:1e5]
set yrange[0.0:0.6]

set xtics 10**2
plot '../H4_cc-pvdz/stat_CIs.dat'  u ($3):($5)  w lp ls 8  notitle, \
     '../H4_cc-pvdz/stat_CI.dat'   u ($3):($5)  w lp ls 3  notitle, \
     '../H4_cc-pvdz/stat_CIo.dat'  u ($3):($5)  w lp ls 4  notitle
set xtics 10**3
###################################################################################

###################################################################################
set xrange[1:1e9]
set yrange[0.0:1.2]

plot '../H8_cc-pvdz/stat_CIs.dat'  u ($3):($5)  w lp ls 8  notitle, \
     '../H8_cc-pvdz/stat_CI.dat'   u ($3):($5)  w lp ls 3  notitle, \
     '../H8_cc-pvdz/stat_CIo.dat'  u ($3):($5)  w lp ls 4  notitle
###################################################################################

# LINE 4
set xlabel 'Number of determinants'
set ylabel "Equilibrium distance ({\305})"

###################################################################################
set xrange[1:1e7]
set yrange[0.89:0.93]
set format y "%.2f"
set ytics 0.01

plot '../HF_cc-pvdz/det_xe_FCI.dat'     u 2:3 w l  ls 2  notitle, \
     '../HF_cc-pvdz/det_xe_CIs.dat'     u 1:3 w lp ls 8  notitle, \
     '../HF_cc-pvdz/det_xe_CI.dat'      u 1:3 w lp ls 3  notitle, \
     '../HF_cc-pvdz/det_xe_CIo.dat'     u 1:3 w lp ls 4  notitle#, \
###################################################################################


###################################################################################
set xrange[1:1e10]
set yrange[1.34:1.50]
set format y "%.2f"
set ytics 0.02

plot '../F2_cc-pvdz/det_xe_FCI.dat'     u 2:3 w l  ls 2  notitle, \
     '../F2_cc-pvdz/det_xe_CIs.dat'     u 1:3 w lp ls 8  notitle, \
     '../F2_cc-pvdz/det_xe_CI.dat'      u 1:3 w lp ls 3  notitle, \
     '../F2_cc-pvdz/det_xe_CIo.dat'     u 1:3 w lp ls 4  notitle#, \
###################################################################################

###################################################################################
set xrange[1:1e11]
set yrange[1.32:1.36]
set format y "%.2f"
set ytics 0.01

bohr    = 1./1.8897161646321

plot '../ethylene_cc-pvdz/det_xe_FCI.dat'     u 2:($3*bohr) w l  ls 2  notitle, \
     '../ethylene_cc-pvdz/det_xe_CIs.dat'     u 1:($3*bohr) w lp ls 8  notitle, \
     '../ethylene_cc-pvdz/det_xe_CI.dat'      u 1:($3*bohr) w lp ls 3  notitle, \
     '../ethylene_cc-pvdz/det_xe_CIo.dat'     u 1:($3*bohr) w lp ls 4  notitle#, \
###################################################################################


###################################################################################
set xrange[1:1e9]
set yrange[1.07:1.13]
set format y "%.2f"
set ytics 0.01
#set ylabel "Equilibrium distance ({\305})"

plot '../N2_cc-pvdz/det_xe_FCI.dat'     u 2:3 w l  ls 2  notitle, \
     '../N2_cc-pvdz/det_xe_CIs.dat'     u 1:3 w lp ls 8  notitle, \
     '../N2_cc-pvdz/det_xe_CI.dat'      u 1:3 w lp ls 3  notitle, \
     '../N2_cc-pvdz/det_xe_CIo.dat'     u 1:3 w lp ls 4  notitle#, \
###################################################################################

###################################################################################
set xrange[1:1e5]
set yrange[1.67:1.71]
set format y "%.2f"
set ytics 0.01
set ylabel "Equilibrium distance (a_{0})"

set xtics 10**2
plot '../H4_cc-pvdz/det_xe_FCI.dat'     u 2:3 w l  ls 2  notitle, \
     '../H4_cc-pvdz/det_xe_CIs.dat'     u 1:3 w lp ls 8  notitle, \
     '../H4_cc-pvdz/det_xe_CI.dat'      u 1:3 w lp ls 3  notitle, \
     '../H4_cc-pvdz/det_xe_CIo.dat'     u 1:3 w lp ls 4  notitle#, \
set xtics 10**3
###################################################################################

###################################################################################
set xrange[1:1e9]
set yrange[1.77:1.81]
set format y "%.2f"
set xtics 10**3
set ytics 0.01
set ylabel "Equilibrium distance (a_{0})"

plot '../H8_cc-pvdz/det_xe_FCI.dat'     u 2:3 w l  ls 2  notitle, \
     '../H8_cc-pvdz/det_xe_CIs.dat'     u 1:3 w lp ls 8  notitle, \
     '../H8_cc-pvdz/det_xe_CI.dat'      u 1:3 w lp ls 3  notitle, \
     '../H8_cc-pvdz/det_xe_CIo.dat'     u 1:3 w lp ls 4  notitle#, \
###################################################################################


# LINE 5
set xlabel 'Number of determinants'
set ylabel "Vibrational frequency (cm^{-1})"

hartree = 4.3597447222071e-18  # joules
bohr    = 1./18897161646.321   # m
amu     = 1.6605402e-27        # kg
c       = 299792458.0          # m/s
mole    = 6.02214076e23

###################################################################################
set xrange[1:1e7]
set yrange[4000:4800]
set format y "%.0f"
set ytics 100
mass1=1.0078250321
mass2=18.9984032
mu=mass1*mass2/(mass1+mass2)*amu
#fac = sqrt( (hartree/(bohr*bohr) ) / mu)/(2.0*pi*c) * 0.01
fac = sqrt(hartree/mu)/(2.0*pi*c) * 0.01 * 10**10

plot '../HF_cc-pvdz/det_aD_FCI.dat'     u 2:(sqrt(2*$5)*$3*fac) w l  ls 2  notitle, \
     '../HF_cc-pvdz/det_aD_CIs.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 8  notitle, \
     '../HF_cc-pvdz/det_aD_CI.dat'      u 1:(sqrt(2*$5)*$3*fac) w lp ls 3  notitle, \
     '../HF_cc-pvdz/det_aD_CIo.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 4  notitle
###################################################################################

###################################################################################
set xrange[1:1e10]
set yrange[600:1200]
set format y "%.0f"
set ytics 100
mass1=18.9984032
mass2=18.9984032
mu=mass1*mass2/(mass1+mass2)*amu
#fac = sqrt( (hartree/(bohr*bohr) ) / mu)/(2.0*pi*c) * 0.01
fac = sqrt(hartree/mu)/(2.0*pi*c) * 0.01 * 10**10

plot '../F2_cc-pvdz/det_aD_FCI.dat'     u 2:(sqrt(2*$5)*$3*fac) w l  ls 2  notitle, \
     '../F2_cc-pvdz/det_aD_CIs.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 8  notitle, \
     '../F2_cc-pvdz/det_aD_CI.dat'      u 1:(sqrt(2*$5)*$3*fac) w lp ls 3  notitle, \
     '../F2_cc-pvdz/det_aD_CIo.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 4  notitle
###################################################################################

###################################################################################
set ylabel "Vibrational frequency (cm^{-1})"
set xrange[1:1e11]
set yrange[1500:1700]
set format y "%.0f"
set ytics 50
mass1=14.0156500642
mass2=14.0156500642
mu=mass1*mass2/(mass1+mass2)*amu
#fac = sqrt( (hartree/(bohr*bohr) ) / mu)/(2.0*pi*c) * 0.01
#fac = sqrt(hartree/mu)/(2.0*pi*c) * 0.01 * 10**10
fac = sqrt(hartree/mu)/(2.0*pi*c) * 0.01 / bohr

plot '../ethylene_cc-pvdz/det_aD_FCI.dat'     u 2:(sqrt(2*$5)*$3*fac) w l  ls 2  notitle, \
     '../ethylene_cc-pvdz/det_aD_CIs.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 8  notitle, \
     '../ethylene_cc-pvdz/det_aD_CI.dat'      u 1:(sqrt(2*$5)*$3*fac) w lp ls 3  notitle, \
     '../ethylene_cc-pvdz/det_aD_CIo.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 4  notitle
###################################################################################

###################################################################################
set ylabel "Vibrational frequency (cm^{-1})"
set xrange[1:1e9]
set yrange[2300:2800]
set format y "%.0f"
set ytics 100
mass1=14.003074
mass2=14.003074
mu=mass1*mass2/(mass1+mass2)*amu
#fac = sqrt( (hartree/(bohr*bohr) ) / mu)/(2.0*pi*c) * 0.01
fac = sqrt(hartree/mu)/(2.0*pi*c) * 0.01 * 10**10

plot '../N2_cc-pvdz/det_aD_FCI.dat'     u 2:(sqrt(2*$5)*$3*fac) w l  ls 2  notitle, \
     '../N2_cc-pvdz/det_aD_CIs.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 8  notitle, \
     '../N2_cc-pvdz/det_aD_CI.dat'      u 1:(sqrt(2*$5)*$3*fac) w lp ls 3  notitle, \
     '../N2_cc-pvdz/det_aD_CIo.dat'     u 1:(sqrt(2*$5)*$3*fac) w lp ls 4  notitle
###################################################################################

###################################################################################
set ylabel "Force constant (Hartree/a_{0})"
set xrange[1:1e5]
set yrange[0.60:0.68]
set format y "%.2f"
set ytics 0.02

set xtics 10**2
plot '../H4_cc-pvdz/det_aD_FCI.dat'     u 2:(2*$3*$3*$5) w l  ls 2  notitle, \
     '../H4_cc-pvdz/det_aD_CIs.dat'     u 1:(2*$3*$3*$5) w lp ls 8  notitle, \
     '../H4_cc-pvdz/det_aD_CI.dat'      u 1:(2*$3*$3*$5) w lp ls 3  notitle, \
     '../H4_cc-pvdz/det_aD_CIo.dat'     u 1:(2*$3*$3*$5) w lp ls 4  notitle
set xtics 10**3
###################################################################################

###################################################################################
set ylabel "Force constant (Hartree/a_{0})"
set xrange[1:1e9]
set yrange[1.14:1.30]
set format y "%.2f"
set ytics 0.02

plot '../H8_cc-pvdz/det_aD_FCI.dat'     u 2:(2*$3*$3*$5) w l  ls 2  notitle, \
     '../H8_cc-pvdz/det_aD_CIs.dat'     u 1:(2*$3*$3*$5) w lp ls 8  notitle, \
     '../H8_cc-pvdz/det_aD_CI.dat'      u 1:(2*$3*$3*$5) w lp ls 3  notitle, \
     '../H8_cc-pvdz/det_aD_CIo.dat'     u 1:(2*$3*$3*$5) w lp ls 4  notitle
###################################################################################

unset label
unset ylabel
set format y ""

