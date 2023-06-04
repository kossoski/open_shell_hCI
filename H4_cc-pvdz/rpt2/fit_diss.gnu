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

x2min=7.0
x2max=10.0

#set xrange[1.0:3.0]
set xrange[1.0:10.0]

# VIEW 1:
set yrange[-2.3:-1.7]
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

# check if file exists
file_exists(file) = int(system("[ -f '".file."' ] && echo '1' || echo '0'")) 
D0=0.0;a0=1.0;xe0=1.0;C0=0.0
D1=0.0;a1=1.0;xe1=1.0;C1=0.0
D2=0.0;a2=1.0;xe2=1.0;C2=0.0
D3=0.0;a3=1.0;xe3=1.0;C3=0.0
D4=0.0;a4=1.0;xe4=1.0;C4=0.0
D5=0.0;a5=1.0;xe5=1.0;C5=0.0
D6=0.0;a6=1.0;xe6=1.0;C6=0.0
D7=0.0;a7=1.0;xe7=1.0;C7=0.0
D8=0.0;a8=1.0;xe8=1.0;C8=0.0
D9=0.0;a9=1.0;xe9=1.0;C9=0.0
D10=0.0;a10=1.0;xe10=1.0;C10=0.0
D11=0.0;a11=1.0;xe11=1.0;C11=0.0
D12=0.0;a12=1.0;xe12=1.0;C12=0.0
D13=0.0;a13=1.0;xe13=1.0;C13=0.0
D14=0.0;a14=1.0;xe14=1.0;C14=0.0
D15=0.0;a15=1.0;xe15=1.0;C15=0.0
D16=0.0;a16=1.0;xe16=1.0;C16=0.0
D17=0.0;a17=1.0;xe17=1.0;C17=0.0
D18=0.0;a18=1.0;xe18=1.0;C18=0.0

M0=0.0;b0=1.0;xe0=1.0;N0=0.0
M1=0.0;b1=1.0;xe1=1.0;N1=0.0
M2=0.0;b2=1.0;xe2=1.0;N2=0.0
M3=0.0;b3=1.0;xe3=1.0;N3=0.0
M4=0.0;b4=1.0;xe4=1.0;N4=0.0
M5=0.0;b5=1.0;xe5=1.0;N5=0.0
M6=0.0;b6=1.0;xe6=1.0;N6=0.0
M7=0.0;b7=1.0;xe7=1.0;N7=0.0
M8=0.0;b8=1.0;xe8=1.0;N8=0.0
M9=0.0;b9=1.0;xe9=1.0;N9=0.0
M10=0.0;b10=1.0;xe10=1.0;N10=0.0
M11=0.0;b11=1.0;xe11=1.0;N11=0.0
M12=0.0;b12=1.0;xe12=1.0;N12=0.0
M13=0.0;b13=1.0;xe13=1.0;N13=0.0
M14=0.0;b14=1.0;xe14=1.0;N14=0.0
M15=0.0;b15=1.0;xe15=1.0;N15=0.0
M16=0.0;b16=1.0;xe16=1.0;N16=0.0
M17=0.0;b17=1.0;xe17=1.0;N17=0.0
M18=0.0;b18=1.0;xe18=1.0;N18=0.0


# function for fitting

f0(x) = D0*(1-exp(-a0*(x-xe0)))**2+C0
g0(x) = M0*(1-exp(-b0*(x-xd0)))**2+N0
filename='pes_fci.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a0=1.0; xe0=STATS_pos_min_y; C0=STATS_min_y
b0=1.0; xd0=STATS_pos_min_y; N0=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D0=last_y-C0
M0=last_y-N0
fit [xmin:xmax] [*:*] f0(x) filename u 1:($2) via D0,a0,xe0,C0
fit [x2min:x2max] [*:*] g0(x) filename u 1:($2) via M0,b0,xd0,N0
}

f1(x) = D1*(1-exp(-a1*(x-xe1)))**2+C1
g1(x) = M1*(1-exp(-b1*(x-xd1)))**2+N1
filename='pes_rhf.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a1=1.0; xe1=STATS_pos_min_y; C1=STATS_min_y
b1=1.0; xd1=STATS_pos_min_y; N1=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D1=last_y-C1
M1=last_y-N1
fit [xmin:xmax] [*:*] f1(x) filename u 1:($2) via D1,a1,xe1,C1
fit [x2min:x2max] [*:*] g1(x) filename u 1:($2) via M1,b1,xd1,N1
}

f2(x) = D2*(1-exp(-a2*(x-xe2)))**2+C2
#g2(x) = M2*(1-exp(-b2*(x-xd2)))**2+N2
g2(x) = -2.0*M2*exp(-b2*(x-xd2))+N2
#g2(x) = -2.0*M2*exp(-b2*x)+N2
filename='pes_CISD.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a2=1.0; xe2=STATS_pos_min_y; C2=STATS_min_y
b2=1.0; xd2=STATS_pos_min_y; N2=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D2=last_y-C2
M2=last_y-N2
fit [xmin:xmax] [*:*] f2(x) filename u 1:($2) via D2,a2,xe2,C2
#fit [x2min:x2max] [*:*] g2(x) filename u 1:($2) via M2,b2,xd2,N2
fit [x2min:x2max] [*:*] g2(x) filename u 1:($2) via M2,b2,N2
}

f3(x) = D3*(1-exp(-a3*(x-xe3)))**2+C3
g3(x) = M3*(1-exp(-b3*(x-xd3)))**2+N3
filename='pes_CISDT.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a3=1.0; xe3=STATS_pos_min_y; C3=STATS_min_y
b3=1.0; xd3=STATS_pos_min_y; N3=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D3=last_y-C3
M3=last_y-N3
fit [xmin:xmax] [*:*] f3(x) filename u 1:($2) via D3,a3,xe3,C3
fit [x2min:x2max] [*:*] g3(x) filename u 1:($2) via M3,b3,xd3,N3
}

f4(x) = D4*(1-exp(-a4*(x-xe4)))**2+C4
g4(x) = M4*(1-exp(-b4*(x-xd4)))**2+N4
filename='pes_CISDTQ.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a4=1.0; xe4=STATS_pos_min_y; C4=STATS_min_y
b4=1.0; xd4=STATS_pos_min_y; N4=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D4=last_y-C4
M4=last_y-N4
fit [xmin:xmax] [*:*] f4(x) filename u 1:($2) via D4,a4,xe4,C4
fit [x2min:x2max] [*:*] g4(x) filename u 1:($2) via M4,b4,xd4,N4
}

f5(x) = D5*(1-exp(-a5*(x-xe5)))**2+C5
g5(x) = M5*(1-exp(-b5*(x-xd5)))**2+N5
filename='pes_CIo1.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a5=1.0; xe5=STATS_pos_min_y; C5=STATS_min_y
b5=1.0; xd5=STATS_pos_min_y; N5=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D5=last_y-C5
M5=last_y-N5
fit [xmin:xmax] [*:*] f5(x) filename u 1:($2) via D5,a5,xe5,C5
fit [x2min:x2max] [*:*] g5(x) filename u 1:($2) via M5,b5,xd5,N5
}

f6(x) = D6*(1-exp(-a6*(x-xe6)))**2+C6
g6(x) = M6*(1-exp(-b6*(x-xd6)))**2+N6
filename='pes_CIo1.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a6=1.0; xe6=STATS_pos_min_y; C6=STATS_min_y
b6=1.0; xd6=STATS_pos_min_y; N6=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D6=last_y-C6
M6=last_y-N6
fit [xmin:xmax] [*:*] f6(x) filename u 1:($2) via D6,a6,xe6,C6
fit [x2min:x2max] [*:*] g6(x) filename u 1:($2) via M6,b6,xd6,N6
}

f7(x) = D7*(1-exp(-a7*(x-xe7)))**2+C7
g7(x) = M7*(1-exp(-b7*(x-xd7)))**2+N7
filename='pes_CIo2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a7=1.0; xe7=STATS_pos_min_y; C7=STATS_min_y
b7=1.0; xd7=STATS_pos_min_y; N7=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D7=last_y-C7
M7=last_y-N7
fit [xmin:xmax] [*:*] f7(x) filename u 1:($2) via D7,a7,xe7,C7
fit [x2min:x2max] [*:*] g7(x) filename u 1:($2) via M7,b7,xd7,N7
}

f8(x) = D8*(1-exp(-a8*(x-xe8)))**2+C8
g8(x) = M8*(1-exp(-b8*(x-xd8)))**2+N8
filename='pes_CIo2.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a8=1.0; xe8=STATS_pos_min_y; C8=STATS_min_y
b8=1.0; xd8=STATS_pos_min_y; N8=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D8=last_y-C8
M8=last_y-N8
fit [xmin:xmax] [*:*] f8(x) filename u 1:($2) via D8,a8,xe8,C8
fit [x2min:x2max] [*:*] g8(x) filename u 1:($2) via M8,b8,xd8,N8
}

f9(x) = D9*(1-exp(-a9*(x-xe9)))**2+C9
g9(x) = M9*(1-exp(-b9*(x-xd9)))**2+N9
filename='pes_CIo3.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a9=1.0; xe9=STATS_pos_min_y; C9=STATS_min_y
b9=1.0; xd9=STATS_pos_min_y; N9=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D9=last_y-C9
M9=last_y-N9
fit [xmin:xmax] [*:*] f9(x) filename u 1:($2) via D9,a9,xe9,C9
fit [x2min:x2max] [*:*] g9(x) filename u 1:($2) via M9,b9,xd9,N9
}

f10(x) = D10*(1-exp(-a10*(x-xe10)))**2+C10
g10(x) = M10*(1-exp(-b10*(x-xd10)))**2+N10
filename='pes_CIo3.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a10=1.0; xe10=STATS_pos_min_y; C10=STATS_min_y
b10=1.0; xd10=STATS_pos_min_y; N10=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D10=last_y-C10
M10=last_y-N10
fit [xmin:xmax] [*:*] f10(x) filename u 1:($2) via D10,a10,xe10,C10
fit [x2min:x2max] [*:*] g10(x) filename u 1:($2) via M10,b10,xd10,N10
}

f11(x) = D11*(1-exp(-a11*(x-xe11)))**2+C11
g11(x) = M11*(1-exp(-b11*(x-xd11)))**2+N11
filename='pes_CIo4.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a11=1.0; xe11=STATS_pos_min_y; C11=STATS_min_y
b11=1.0; xd11=STATS_pos_min_y; N11=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D11=last_y-C11
M11=last_y-N11
fit [xmin:xmax] [*:*] f11(x) filename u 1:($2) via D11,a11,xe11,C11
fit [x2min:x2max] [*:*] g11(x) filename u 1:($2) via M11,b11,xd11,N11
}

f12(x) = D12*(1-exp(-a12*(x-xe12)))**2+C12
g12(x) = M12*(1-exp(-b12*(x-xd12)))**2+N12
filename='pes_ooCISD.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a12=1.0; xe12=STATS_pos_min_y; C12=STATS_min_y
b12=1.0; xd12=STATS_pos_min_y; N12=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D12=last_y-C12
M12=last_y-N12
fit [xmin:xmax] [*:*] f12(x) filename u 1:($2) via D12,a12,xe12,C12
fit [x2min:x2max] [*:*] g12(x) filename u 1:($2) via M12,b12,xd12,N12
}

f13(x) = D13*(1-exp(-a13*(x-xe13)))**2+C13
g13(x) = M13*(1-exp(-b13*(x-xd13)))**2+N13
filename='pes_ooCISDT.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a13=1.0; xe13=STATS_pos_min_y; C13=STATS_min_y
b13=1.0; xd13=STATS_pos_min_y; N13=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D13=last_y-C13
M13=last_y-N13
fit [xmin:xmax] [*:*] f13(x) filename u 1:($2) via D13,a13,xe13,C13
fit [x2min:x2max] [*:*] g13(x) filename u 1:($2) via M13,b13,xd13,N13
}

f14(x) = D14*(1-exp(-a14*(x-xe14)))**2+C14
g14(x) = M14*(1-exp(-b14*(x-xd14)))**2+N14
filename='pes_ooCIo1.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a14=1.0; xe14=STATS_pos_min_y; C14=STATS_min_y
b14=1.0; xd14=STATS_pos_min_y; N14=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D14=last_y-C14
M14=last_y-N14
fit [xmin:xmax] [*:*] f14(x) filename u 1:($2) via D14,a14,xe14,C14
fit [x2min:x2max] [*:*] g14(x) filename u 1:($2) via M14,b14,xd14,N14
}

f15(x) = D15*(1-exp(-a15*(x-xe15)))**2+C15
g15(x) = M15*(1-exp(-b15*(x-xd15)))**2+N15
filename='pes_ooCIo1.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a15=1.0; xe15=STATS_pos_min_y; C15=STATS_min_y
b15=1.0; xd15=STATS_pos_min_y; N15=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D15=last_y-C15
M15=last_y-N15
fit [xmin:xmax] [*:*] f15(x) filename u 1:($2) via D15,a15,xe15,C15
fit [x2min:x2max] [*:*] g15(x) filename u 1:($2) via M15,b15,xd15,N15
}

f16(x) = D16*(1-exp(-a16*(x-xe16)))**2+C16
g16(x) = M16*(1-exp(-b16*(x-xd16)))**2+N16
filename='pes_ooCIo2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a16=1.0; xe16=STATS_pos_min_y; C16=STATS_min_y
b16=1.0; xd16=STATS_pos_min_y; N16=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D16=last_y-C16
M16=last_y-N16
fit [xmin:xmax] [*:*] f16(x) filename u 1:($2) via D16,a16,xe16,C16
fit [x2min:x2max] [*:*] g16(x) filename u 1:($2) via M16,b16,xd16,N16
}

f17(x) = D17*(1-exp(-a17*(x-xe17)))**2+C17
g17(x) = M17*(1-exp(-b17*(x-xd17)))**2+N17
filename='pes_ooCIo2.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a17=1.0; xe17=STATS_pos_min_y; C17=STATS_min_y
b17=1.0; xd17=STATS_pos_min_y; N17=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D17=last_y-C17
M17=last_y-N17
fit [xmin:xmax] [*:*] f17(x) filename u 1:($2) via D17,a17,xe17,C17
fit [x2min:x2max] [*:*] g17(x) filename u 1:($2) via M17,b17,xd17,N17
}

f18(x) = D18*(1-exp(-a18*(x-xe18)))**2+C18
g18(x) = M18*(1-exp(-b18*(x-xd18)))**2+N18
filename='pes_ooCIo3.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a18=1.0; xe18=STATS_pos_min_y; C18=STATS_min_y
b18=1.0; xd18=STATS_pos_min_y; N18=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D18=last_y-C18
M18=last_y-N18
fit [xmin:xmax] [*:*] f18(x) filename u 1:($2) via D18,a18,xe18,C18
fit [x2min:x2max] [*:*] g18(x) filename u 1:($2) via M18,b18,xd18,N18
}


 

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

plot 'pes_rhf.dat'    w lp ls 1 notitle, \
     'pes_CISD.dat'   w lp ls 3 notitle, \
     'pes_CISDT.dat'  w lp ls 3 notitle, \
     'pes_CISDTQ.dat' w lp ls 3 notitle, \
     'pes_CIo1.dat'   w lp ls 4 notitle, \
     'pes_CIo1.5.dat' w lp ls 5 notitle, \
     'pes_CIo2.dat'   w lp ls 4 notitle, \
     'pes_CIo2.5.dat' w lp ls 5 notitle, \
     'pes_CIo3.dat'   w lp ls 4 notitle, \
     'pes_CIo3.5.dat' w lp ls 5 notitle, \
     'pes_CIo4.dat'   w lp ls 4 notitle, \
     'pes_ooCISD.dat'   w lp ls 3 notitle, \
     'pes_ooCISDT.dat'  w lp ls 3 notitle, \
     'pes_ooCIo1.dat'   w lp ls 4 notitle, \
     'pes_ooCIo1.5.dat' w lp ls 5 notitle, \
     'pes_ooCIo2.dat'   w lp ls 4 notitle, \
     'pes_ooCIo2.5.dat' w lp ls 5 notitle, \
     'pes_ooCIo3.dat'   w lp ls 4 notitle, \
     'pes_fci.dat'      w lp ls 2 notitle, \
     [xmin:xmax] f0(x)  w l ls 9 notitle, \
     [xmin:xmax] f1(x)  w l ls 9 notitle, \
     [xmin:xmax] f2(x)  w l ls 9 notitle, \
     [xmin:xmax] f3(x)  w l ls 9 notitle, \
     [xmin:xmax] f4(x)   w l ls 9 notitle, \
     [xmin:xmax] f5(x)  w l ls 9 notitle, \
     [xmin:xmax] f6(x)  w l ls 9 notitle, \
     [xmin:xmax] f7(x)  w l ls 9 notitle, \
     [xmin:xmax] f8(x)  w l ls 9 notitle, \
     [xmin:xmax] f9(x)  w l ls 9 notitle, \
     [xmin:xmax] f10(x)  w l ls 9 notitle, \
     [xmin:xmax] f11(x)  w l ls 9 notitle, \
     [xmin:xmax] f12(x)  w l ls 9 notitle, \
     [xmin:xmax] f13(x)  w l ls 9 notitle, \
     [xmin:xmax] f14(x)  w l ls 9 notitle, \
     [xmin:xmax] f15(x)  w l ls 9 notitle, \
     [xmin:xmax] f16(x)  w l ls 9 notitle, \
     [xmin:xmax] f17(x)  w l ls 9 notitle, \
     [xmin:xmax] f18(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g0(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g1(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g2(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g3(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g4(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g5(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g6(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g7(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g8(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g9(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g10(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g11(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g12(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g13(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g14(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g15(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g16(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g17(x)  w l ls 9 notitle, \
     [x2min:2*x2max] g18(x)  w l ls 9 notitle#, \

###################################################################################
###################################################################################

pause -1
