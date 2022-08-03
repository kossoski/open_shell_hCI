#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_error.png'

set terminal postscript eps size 5.3,5.3 enhanced color \
    font 'Helvetica,24' linewidth 2
set output 'plot_error.eps'
set encoding iso_8859_1

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

xmin=0.6
xmax=8.0
#set xrange[0.95:5.0]
set xrange[0.6:8.0]

ymin=1.0e-4
ymax=0.1
# VIEW 1
#set logscale y
#set yrange[1.0e-4:0.1]
#set format y "10^{%T}"

# VIEW 2
set yrange[-0.05:0.10]
set format y "%.2f"

###################################################################################
###################################################################################


if (!exists("MP_LEFT"))   MP_LEFT = 0.15
if (!exists("MP_RIGHT"))  MP_RIGHT = 0.97
if (!exists("MP_BOTTOM")) MP_BOTTOM = 0.10
if (!exists("MP_TOP"))    MP_TOP = 0.97
if (!exists("MP_xGAP"))   MP_xGAP = 0.06
if (!exists("MP_yGAP"))   MP_yGAP = 0.08

set multiplot layout 1,2 rowsfirst \
               margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_xGAP, MP_yGAP

set style line 1 dt 1 lw 3 linecolor rgb "gray60"
set style line 2 dt 1 lw 3 linecolor rgb "black"
set style line 3 dt 1 lw 3 linecolor rgb "light-red"
set style line 4 dt 1 lw 3 linecolor rgb "sea-green"
set style line 5 dt 2 lw 3 linecolor rgb "sea-green"
set style line 6 dt 1 lw 3 linecolor rgb "orange"
set style line 7 dt 2 lw 3 linecolor rgb "orange"
set style line 8 dt 1 lw 3 linecolor rgb "medium-blue"

set xlabel "Distance ({\305})"
set ylabel 'Energy error (Hartree)'

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

plot '< paste pes_fci.dat pes_rhf.dat'    using 1:($4-$2) w l ls 1 notitle, \
     '< paste pes_fci.dat pes_CISD.dat'   using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_CISDT.dat'  using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_CISDTQ.dat' using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_s1.dat'     using 1:($4-$2) w l ls 8 notitle, \
     '< paste pes_fci.dat pes_s3.dat'     using 1:($4-$2) w l ls 8 notitle, \
     '< paste pes_fci.dat pes_s5.dat'     using 1:($4-$2) w l ls 8 notitle, \
     '< paste pes_fci.dat pes_CIo1.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_CIo1.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo2.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_CIo2.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo3.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_CIo3.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo4.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_fci.dat'    using 1:($4-$2) w l ls 2 notitle

unset ylabel
set format y ""

plot '< paste pes_fci.dat pes_rhf.dat'      using 1:($4-$2) w l ls 1 notitle, \
     '< paste pes_fci.dat pes_ooCIS.dat'    using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_ooCISD.dat'   using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_ooCIs1.dat'   using 1:($4-$2) w l ls 8 notitle, \
     '< paste pes_fci.dat pes_ooCIo1.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_ooCIo1.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_ooCIo2.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_fci.dat'      using 1:($4-$2) w l ls 2 notitle

###################################################################################
###################################################################################
