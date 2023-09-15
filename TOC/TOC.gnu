#!/bin/gnuplot

set terminal postscript eps size 3.25in,1.75in enhanced color \
    font 'Helvetica,16' linewidth 2
set output 'TOC.eps'
set encoding iso_8859_1

set border lw 0.4

ROWS=1
COLS=2

set multiplot layout ROWS,COLS columnsfirst

rgb(r,g,b) = 65536 * int(r) + 256 * int(g) + int(b)

set style line 1 dt 1 pt 6 lw 3 linecolor rgb "gray40"
set style line 2 dt 1 pt 6 lw 3 linecolor rgb "black"
set style line 3 dt 1 pt 6 lw 3 linecolor rgbcolor rgb(206,24,30)
set style line 4 dt 1 pt 6 lw 3 linecolor rgbcolor rgb(0,147,83)
set style line 5 dt 2 pt 6 lw 3 linecolor rgb "sea-green"
set style line 6 dt 1 pt 6 lw 3 linecolor rgb "orange"
set style line 7 dt 2 pt 6 lw 3 linecolor rgb "orange"
set style line 8 dt 1 pt 6 lw 3 linecolor rgbcolor rgb(28,54,135)

set style line 30 dt 1 pt 7 lw 3 ps 2.5 linecolor rgbcolor rgb(243,123,112)
set style line 40 dt 1 pt 7 lw 3 ps 2.5 linecolor rgbcolor rgb(101,194,149)
set style line 80 dt 1 pt 7 lw 3 ps 2.5 linecolor rgbcolor rgb( 94,138,199)

set xrange[-2.0:2.0]
set yrange[0.0:3.5]
unset xtics
unset ytics
set ylabel ''

set style fill solid noborder
set boxwidth 0.10 absolute

###################################################################################

set label '{/Bold {Excitation energies}}'at -1.5,4.00 tc ls 2 font 'Helvetica,18'

sum = 69;
bin_width = 0.10;
bin_number(x) = floor(x/bin_width)
rounded(x) = bin_width * ( bin_number(x) + 0.0 )

    s1x = 0.56
    s1y = 1.05
    set size s1x, s1y
    o1x = -0.02
    o1y = -0.06
    set origin o1x, o1y

    set size   s1x, s1y*0.42
    set origin o1x+s1x*0.0, o1y+s1y*0.58
set label '{/Bold MAE = 0.17 eV}'     at  0.10,2.5 tc ls 2 font 'Helvetica,15'
set label '{/Symbol D}{/Bold {hCI2}}' at -1.5,2.5 tc ls 4 font 'Helvetica,20'
plot '../excited_states/delta.hci2.all.mse' u (rounded($1)):(1./(sum*bin_width)) smooth frequency with boxes ls 4  notitle
unset label

    set size   s1x, s1y*0.42
    set origin o1x+s1x*0.0, o1y+s1y*0.29
set label '{/Bold MAE = 0.16 eV}'     at  0.10,2.5 tc ls 2 font 'Helvetica,15'
set label '{/Symbol D}{/Bold {CISD}}' at -1.5,2.5 tc ls 3 font 'Helvetica,20'
plot '../excited_states/delta.cisd.all.mse' u (rounded($1)):(1./(sum*bin_width)) smooth frequency with boxes ls 3  notitle
unset label

    set size   s1x, s1y*0.42
    set origin o1x+s1x*0.0, o1y+s1y*0.0
set label '{/Bold MAE = 0.64 eV}'     at  0.10,2.5 tc ls 2 font 'Helvetica,15'
set label '{/Symbol D}{/Bold {sCI2}}' at -1.5,2.5 tc ls 8 font 'Helvetica,20'
plot '../excited_states/delta.sci2.all.mse' u (rounded($1)):(1./(sum*bin_width)) smooth frequency with boxes ls 8  notitle

###################################################################################

    s1x = 0.56
    s1y = 1.05
    set size s1x, s1y
    o1x = 0.50
    o1y = -0.06
    set origin o1x, o1y

set xrange[0.6:5.0]
set yrange[-75.57:-75.23]
unset xtics
unset ytics
set label '{/Bold {OH dissociation}}'at 1.5,-75.215 tc ls 2 font 'Helvetica,18'
set label '{/Bold {ROHF}}'      at 1.7,-75.250 tc ls 1 font 'Helvetica,18'
set label '{/Bold {DOCI}}'      at 3.9,-75.250 tc ls 8 font 'Helvetica,18'
set label '{/Bold {CISD}}'      at 3.9,-75.330 tc ls 3 font 'Helvetica,18'
set label '{/Bold {hCI2}}'      at 3.9,-75.390 tc ls 4 font 'Helvetica,18'
set label '{/Bold {FCI}}'       at 3.9,-75.430 tc ls 2 font 'Helvetica,18'
plot '../OH_cc-pvdz/pes_rohf.dat'   w l ls 1 notitle ,\
     '../OH_cc-pvdz/pes_s1.dat'     w l ls 8 notitle ,\
     '../OH_cc-pvdz/pes_CISD.dat'   w l ls 3 notitle ,\
     '../OH_cc-pvdz/pes_CIo2.dat'   w l ls 4 notitle ,\
     '../OH_cc-pvdz/pes_fci.dat'    w l ls 2 notitle

###################################################################################

unset multiplot
