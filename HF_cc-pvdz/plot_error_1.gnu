#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_error.png'
set terminal postscript eps size 5.3,3.0 enhanced color \
    font 'Helvetica,16' linewidth 2
set output 'plot_error.eps'

xmin=0.5
xmax=6.0
ymin=1.0e-3
ymax=1.0

set xrange[0.5:6.0]

# VIEW 1
set logscale y
set yrange[1.0e-3:1.0]
# VIEW 2
#set yrange[0.0:0.5]
# VIEW 3
#set yrange[0.0:0.08]
# VIEW 4
#set yrange[0.0:0.005]

set style line 1 dt 1 lw 2 linecolor rgb "gray"
set style line 2 dt 1 lw 2 linecolor rgb "black"
set style line 3 dt 1 lw 2 linecolor rgb "light-red"
set style line 4 dt 1 lw 2 linecolor rgb "sea-green"
set style line 5 dt 2 lw 2 linecolor rgb "sea-green"
set style line 6 dt 1 lw 2 linecolor rgb "orange"
set style line 7 dt 2 lw 2 linecolor rgb "orange"

set style line 13 dt 1 lw 2 linecolor rgb "red"
set style line 14 dt 1 lw 2 linecolor rgb "forest-green"
set style line 15 dt 2 lw 2 linecolor rgb "forest-green"


set xlabel 'Distance (angstrom)'
set ylabel 'Energy error (Hartree)'

plot '< paste pes_fci.dat pes_rhf.dat'   using 1:($4-$2) w l ls 1 notitle, \
     '< paste pes_fci.dat pes_s4.e2.dat' using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_s6.e3.dat' using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_CIo1.dat'   using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo1.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo2.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_CIo2.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo3.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_ooCISD.dat' using 1:($4-$2) w l ls 13 notitle, \
     '< paste pes_fci.dat pes_ooCISDT.dat' using 1:($4-$2) w l ls 13 notitle, \
     '< paste pes_fci.dat pes_ooCIo1.dat'   using 1:($4-$2) w l ls 15 notitle, \
     '< paste pes_fci.dat pes_ooCIo1.5.dat'   using 1:($4-$2) w l ls 15 notitle, \
     '< paste pes_fci.dat pes_ooCIo2.dat'   using 1:($4-$2) w l ls 14 notitle, \
     '< paste pes_fci.dat pes_fci.dat'   using 1:($4-$2) w l ls 2 notitle
#    '< paste pes_fci.dat pes_s8.e4.dat' using 1:($4-$2) w l ls 3 notitle, \
#    '< paste pes_fci.dat pes_CIo3.5.dat' using 1:($4-$2) w l ls 5 notitle, \
#    '< paste pes_fci.dat pes_CIo4.dat'   using 1:($4-$2) w l ls 4 notitle, \
#    '< paste pes_fci.dat pes_pccd.dat'  using 1:($4-$2) w l ls 6 notitle, \
#    '< paste pes_fci.dat pes_s0.e2.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s2.e2.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s2.e3.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s4.e3.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s0.e4.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s2.e4.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s4.e4.dat' using 1:($4-$2) w l ls 1 notitle, \

#pause -1
