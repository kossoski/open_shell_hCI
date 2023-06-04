#!/bin/gnuplot

#set terminal pngcairo size 600,600 enhanced font 'Verdana,10'
#set output 'plot_pes.png'
#set terminal postscript eps size 5.3,3.0 enhanced color \

#set terminal postscript eps size 5.3,5.3 enhanced color \
#    font 'Helvetica,24' linewidth 2
#set output 'fit_eq.eps'
set encoding iso_8859_1

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:
xmin=1.45
xmax=1.95

#set xrange[1.0:3.0]
#set xrange[1.0:10.0]

# VIEW 1:
#set yrange[-2.3:-1.7]
#set yrange[-2.3:-2.1]
###################################################################################
###################################################################################

set format y "%.1f"

set style line 1 dt 1 lw 3 linecolor rgb "gray60"
set style line 2 dt 1 lw 3 linecolor rgb "black"
set style line 3 dt 1 lw 3 linecolor rgb "light-red"
set style line 4 dt 1 lw 3 linecolor rgb "sea-green"
set style line 5 dt 2 lw 3 linecolor rgb "sea-green"
set style line 6 dt 1 lw 3 linecolor rgb "orange"
set style line 7 dt 2 lw 3 linecolor rgb "orange"
set style line 9 dt 1 lw 2 linecolor rgb "violet"

set xlabel "Distance (a_{0})"
set ylabel 'Energy (Hartree)'

# function for fitting
 
f0(x) = D0*(1-exp(-a0*(x-xe0)))**2+C0
filename='pes_fci.dat'
stats filename using 1:2 nooutput
print STATS_records
a0=1.0; xe0=STATS_pos_min_y; C0=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
print last_y
D0=last_y-C0
fit [xmin:xmax] [*:*] f0(x) filename u 1:($2) via D0,a0,xe0,C0

#D0=0.25; a0=1.0; xe0=1.7; C0=-2.0
#fit [xmin:xmax] [*:*] f0(x) 'pes_fci.dat' u 1:($2) via D0,a0,xe0,C0
#
f1(x) = D1*(1-exp(-a1*(x-xe1)))**2+C1
D1=0.25; a1=1.0; xe1=1.7; C1=-2.0
fit [xmin:xmax] [*:*] f1(x) 'pes_rhf.dat' u 1:($2) via D1,a1,xe1,C1
#
f2(x) = D2*(1-exp(-a2*(x-xe2)))**2+C2
D2=0.25; a2=1.0; xe2=1.7; C2=-2.0
fit [xmin:xmax] [*:*] f2(x) 'pes_CISD.dat' u 1:($2) via D2,a2,xe2,C2
#
f3(x) = D3*(1-exp(-a3*(x-xe3)))**2+C3
D3=0.25; a3=1.0; xe3=1.7; C3=-2.0
fit [xmin:xmax] [*:*] f3(x) 'pes_CISDT.dat' u 1:($2) via D3,a3,xe3,C3
#
#f4(x) = D4*(1-exp(-a4*(x-xe4)))**2+C4
#D4=0.25; a4=1.0; xe4=1.7; C4=-2.0
#fit [xmin:xmax] [*:*] f4(x) 'pes_CISDTQ.dat' u 1:($2) via D4,a4,xe4,C4
#
f5(x) = D5*(1-exp(-a5*(x-xe5)))**2+C5
D5=0.25; a5=1.0; xe5=1.7; C5=-2.0
fit [xmin:xmax] [*:*] f5(x) 'pes_CIo1.dat' u 1:($2) via D5,a5,xe5,C5
#
f6(x) = D6*(1-exp(-a6*(x-xe6)))**2+C6
D6=0.25; a6=1.0; xe6=1.7; C6=-2.0
fit [xmin:xmax] [*:*] f6(x) 'pes_CIo1.5.dat' u 1:($2) via D6,a6,xe6,C6
#
f7(x) = D7*(1-exp(-a7*(x-xe7)))**2+C7
D7=0.25; a7=1.0; xe7=1.7; C7=-2.0
fit [xmin:xmax] [*:*] f7(x) 'pes_CIo2.dat' u 1:($2) via D7,a7,xe7,C7
#
f8(x) = D8*(1-exp(-a8*(x-xe8)))**2+C8
D8=0.25; a8=1.0; xe8=1.7; C8=-2.0
fit [xmin:xmax] [*:*] f8(x) 'pes_CIo2.5.dat' u 1:($2) via D8,a8,xe8,C8
#
f9(x) = D9*(1-exp(-a9*(x-xe9)))**2+C9
D9=0.25; a9=1.0; xe9=1.7; C9=-2.0
fit [xmin:xmax] [*:*] f9(x) 'pes_CIo3.dat' u 1:($2) via D9,a9,xe9,C9
#
f10(x) = D10*(1-exp(-a10*(x-xe10)))**2+C10
D10=0.25; a10=1.0; xe10=1.7; C10=-2.0
fit [xmin:xmax] [*:*] f10(x) 'pes_CIo3.5.dat' u 1:($2) via D10,a10,xe10,C10
#
#f11(x) = D11*(1-exp(-a11*(x-xe11)))**2+C11
#D11=0.25; a11=1.0; xe11=1.7; C11=-2.0
#fit [xmin:xmax] [*:*] f11(x) 'pes_CIo4.dat' u 1:($2) via D11,a11,xe11,C11
#
f12(x) = D12*(1-exp(-a12*(x-xe12)))**2+C12
D12=0.25; a12=1.0; xe12=1.7; C12=-2.0
fit [xmin:xmax] [*:*] f12(x) 'pes_ooCISD.dat' u 1:($2) via D12,a12,xe12,C12
#
#f13(x) = D13*(1-exp(-a13*(x-xe13)))**2+C13
#D13=0.25; a13=1.0; xe13=1.7; C13=-2.0
#fit [xmin:xmax] [*:*] f13(x) 'pes_ooCISDT.dat' u 1:($2) via D13,a13,xe13,C13
#
f14(x) = D14*(1-exp(-a14*(x-xe14)))**2+C14
D14=0.25; a14=1.0; xe14=1.7; C14=-2.0
fit [xmin:xmax] [*:*] f14(x) 'pes_ooCIo1.dat' u 1:($2) via D14,a14,xe14,C14
#
f15(x) = D15*(1-exp(-a15*(x-xe15)))**2+C15
D15=0.25; a15=1.0; xe15=1.7; C15=-2.0
fit [xmin:xmax] [*:*] f15(x) 'pes_ooCIo1.5.dat' u 1:($2) via D15,a15,xe15,C15
#
#f16(x) = D16*(1-exp(-a16*(x-xe16)))**2+C16
#D16=0.25; a16=1.0; xe16=1.7; C16=-2.0
#fit [xmin:xmax] [*:*] f16(x) 'pes_ooCIo2.dat' u 1:($2) via D16,a16,xe16,C16
#
#f17(x) = D17*(1-exp(-a17*(x-xe17)))**2+C17
#D17=0.25; a17=1.0; xe17=1.7; C17=-2.0
#fit [xmin:xmax] [*:*] f17(x) 'pes_ooCIo2.5.dat' u 1:($2) via D17,a17,xe17,C17
#
#f18(x) = D18*(1-exp(-a18*(x-xe18)))**2+C18
#D18=0.25; a18=1.0; xe18=1.7; C18=-2.0
#fit [xmin:xmax] [*:*] f18(x) 'pes_ooCIo3.dat' u 1:($2) via D18,a18,xe18,C18

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

plot 'pes_rhf.dat'    w lp ls 1 notitle, \
     'pes_CISD.dat'   w lp ls 3 notitle, \
     'pes_CISDT.dat'  w lp ls 3 notitle, \
     'pes_CIo1.dat'   w lp ls 4 notitle, \
     'pes_CIo1.5.dat' w lp ls 5 notitle, \
     'pes_CIo2.dat'   w lp ls 4 notitle, \
     'pes_CIo2.5.dat' w lp ls 5 notitle, \
     'pes_ooCISD.dat'   w lp ls 3 notitle, \
     'pes_ooCIo1.dat'   w lp ls 4 notitle, \
     'pes_ooCIo1.5.dat' w lp ls 5 notitle, \
     'pes_fci.dat'      w lp ls 2 notitle, \
     [xmin:xmax] f0(x)  w l ls 9 notitle, \
     [xmin:xmax] f1(x)  w l ls 9 notitle, \
     [xmin:xmax] f2(x)  w l ls 9 notitle, \
     [xmin:xmax] f3(x)  w l ls 9 notitle, \
     [xmin:xmax] f5(x)  w l ls 9 notitle, \
     [xmin:xmax] f6(x)  w l ls 9 notitle, \
     [xmin:xmax] f7(x)  w l ls 9 notitle, \
     [xmin:xmax] f8(x)  w l ls 9 notitle, \
     [xmin:xmax] f9(x)  w l ls 9 notitle, \
     [xmin:xmax] f10(x)  w l ls 9 notitle, \
     [xmin:xmax] f12(x)  w l ls 9 notitle, \
     [xmin:xmax] f14(x)  w l ls 9 notitle, \
     [xmin:xmax] f15(x)  w l ls 9 notitle#, \
#    'pes_ooCIo2.dat'   w lp ls 4 notitle, \
#    [xmin:xmax] f4(x)  w l ls 9 notitle, \
#    [xmin:xmax] f11(x)  w l ls 9 notitle, \
#    [xmin:xmax] f13(x)  w l ls 9 notitle, \
#    [xmin:xmax] f16(x)  w l ls 9 notitle, \
#    [xmin:xmax] f17(x)  w l ls 9 notitle, \
#    [xmin:xmax] f18(x)  w l ls 9 notitle#, \

###################################################################################
###################################################################################

pause -1
