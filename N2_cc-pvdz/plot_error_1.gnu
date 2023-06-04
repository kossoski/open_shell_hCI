#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_error.png'

set xrange[0.7:4.0]
# VIEW 1
#set logscale y
#set yrange[1.0e-4:2.0]
# VIEW 2
set yrange[0.0:0.5]

set style line 1 dt 1 lw 1 linecolor rgb "gray"
set style line 2 dt 1 lw 1 linecolor rgb "red"
set style line 3 dt 1 lw 1 linecolor rgb "green"
set style line 4 dt 1 lw 1 linecolor rgb "blue"
set style line 5 dt 2 lw 1 linecolor rgb "blue"
set style line 6 dt 1 lw 1 linecolor rgb "orange"

set xlabel 'Distance (angstrom)'
set ylabel 'Energy error (Hartree)'

plot '< paste pes_fci.dat pes_rhf.dat'   using 1:($4-$2) w l ls 1 notitle, \
     '< paste pes_fci.dat pes_s4.e2.dat' using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_s6.e3.dat' using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_s8.e4.dat' using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_s10.e5.dat' using 1:($4-$2) w l ls 3 notitle, \
     '< paste pes_fci.dat pes_CIo1.dat'   using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo1.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo2.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_CIo2.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo3.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_CIo3.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo4.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_CIo4.5.dat' using 1:($4-$2) w l ls 5 notitle, \
     '< paste pes_fci.dat pes_CIo5.dat'   using 1:($4-$2) w l ls 4 notitle, \
     '< paste pes_fci.dat pes_fci.dat'   using 1:($4-$2) w l ls 2 notitle
#    '< paste pes_fci.dat pes_s12.e6.dat' using 1:($4-$2) w l ls 3 notitle, \
#    '< paste pes_fci.dat pes_pccd.dat'  using 1:($4-$2) w l ls 6 notitle, \
#    '< paste pes_fci.dat pes_s0.e2.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s2.e2.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s2.e3.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s4.e3.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s0.e4.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s2.e4.dat' using 1:($4-$2) w l ls 1 notitle, \
#    '< paste pes_fci.dat pes_s4.e4.dat' using 1:($4-$2) w l ls 1 notitle, \

pause -1
