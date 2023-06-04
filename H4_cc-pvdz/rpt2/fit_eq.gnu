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
#xmin=1.55
#xmax=1.85

#set xrange[1.0:3.0]
set xrange[1.0:10.0]

# VIEW 1:
set yrange[-2.3:-1.7]
###################################################################################
###################################################################################

set format y "%.1f"

set style line 1  dt 1 lw 3 linecolor rgb "gray60"
set style line 2  dt 1 lw 3 linecolor rgb "black"
set style line 9  dt 1 lw 2 linecolor rgb "violet"
set style line 3  dt 1 lw 2 linecolor rgb "light-red"   pt 13 ps 2
set style line 4  dt 1 lw 2 linecolor rgb "sea-green"   pt 13 ps 2
set style line 5  dt 2 lw 2 linecolor rgb "sea-green"   pt 13 ps 2
set style line 8  dt 1 lw 2 linecolor rgb "medium-blue" pt 13 ps 2
set style line 13 dt 1 lw 2 linecolor rgb "light-red"   pt 7  ps 2
set style line 14 dt 1 lw 2 linecolor rgb "sea-green"   pt 7  ps 2
set style line 15 dt 2 lw 2 linecolor rgb "sea-green"   pt 7  ps 2
set style line 18 dt 1 lw 2 linecolor rgb "medium-blue" pt 7  ps 2

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
D19=0.0;a19=1.0;xe19=1.0;C19=0.0
D20=0.0;a20=1.0;xe20=1.0;C20=0.0
D21=0.0;a21=1.0;xe21=1.0;C21=0.0
D22=0.0;a22=1.0;xe22=1.0;C22=0.0
D23=0.0;a23=1.0;xe23=1.0;C23=0.0
D24=0.0;a24=1.0;xe24=1.0;C24=0.0

# function for fitting
 
f0(x) = D0*(1-exp(-a0*(x-xe0)))**2+C0
filename='pes_fci.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a0=1.0; xe0=STATS_pos_min_y; C0=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D0=last_y-C0
fit [xmin:xmax] [*:*] f0(x) filename u 1:($2) via D0,a0,xe0,C0
}

f1(x) = D1*(1-exp(-a1*(x-xe1)))**2+C1
filename='pes_rhf.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a1=1.0; xe1=STATS_pos_min_y; C1=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D1=last_y-C1
fit [xmin:xmax] [*:*] f1(x) filename u 1:($2) via D1,a1,xe1,C1
}
 
f2(x) = D2*(1-exp(-a2*(x-xe2)))**2+C2
filename='pes_CISD.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a2=1.0; xe2=STATS_pos_min_y; C2=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D2=last_y-C2
fit [xmin:xmax] [*:*] f2(x) filename u 1:($2) via D2,a2,xe2,C2
}
 
f3(x) = D3*(1-exp(-a3*(x-xe3)))**2+C3
filename='pes_CISDT.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a3=1.0; xe3=STATS_pos_min_y; C3=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D3=last_y-C3
fit [xmin:xmax] [*:*] f3(x) filename u 1:($2) via D3,a3,xe3,C3
}
 
f4(x) = D4*(1-exp(-a4*(x-xe4)))**2+C4
filename='pes_CISDTQ.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a4=1.0; xe4=STATS_pos_min_y; C4=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D4=last_y-C4
fit [xmin:xmax] [*:*] f4(x) filename u 1:($2) via D4,a4,xe4,C4
}
 
f5(x) = D5*(1-exp(-a5*(x-xe5)))**2+C5
filename='pes_s0.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a5=1.0; xe5=STATS_pos_min_y; C5=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D5=last_y-C5
fit [xmin:xmax] [*:*] f5(x) filename u 1:($2) via D5,a5,xe5,C5
}
 
f6(x) = D6*(1-exp(-a6*(x-xe6)))**2+C6
filename='pes_s2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a6=1.0; xe6=STATS_pos_min_y; C6=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D6=last_y-C6
fit [xmin:xmax] [*:*] f6(x) filename u 1:($2) via D6,a6,xe6,C6
}
 
f7(x) = D7*(1-exp(-a7*(x-xe7)))**2+C7
filename='pes_s4.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a7=1.0; xe7=STATS_pos_min_y; C7=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D7=last_y-C7
fit [xmin:xmax] [*:*] f7(x) filename u 1:($2) via D7,a7,xe7,C7
}
 
f8(x) = D8*(1-exp(-a8*(x-xe8)))**2+C8
filename='pes_CIo1.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a8=1.0; xe8=STATS_pos_min_y; C8=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D8=last_y-C8
fit [xmin:xmax] [*:*] f8(x) filename u 1:($2) via D8,a8,xe8,C8
}
 
f9(x) = D9*(1-exp(-a9*(x-xe9)))**2+C9
filename='pes_CIo1.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a9=1.0; xe9=STATS_pos_min_y; C9=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D9=last_y-C9
fit [xmin:xmax] [*:*] f9(x) filename u 1:($2) via D9,a9,xe9,C9
}
 
f10(x) = D10*(1-exp(-a10*(x-xe10)))**2+C10
filename='pes_CIo2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a10=1.0; xe10=STATS_pos_min_y; C10=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D10=last_y-C10
fit [xmin:xmax] [*:*] f10(x) filename u 1:($2) via D10,a10,xe10,C10
}
 
f11(x) = D11*(1-exp(-a11*(x-xe11)))**2+C11
filename='pes_CIo2.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a11=1.0; xe11=STATS_pos_min_y; C11=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D11=last_y-C11
fit [xmin:xmax] [*:*] f11(x) filename u 1:($2) via D11,a11,xe11,C11
}
 
f12(x) = D12*(1-exp(-a12*(x-xe12)))**2+C12
filename='pes_CIo3.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a12=1.0; xe12=STATS_pos_min_y; C12=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D12=last_y-C12
fit [xmin:xmax] [*:*] f12(x) filename u 1:($2) via D12,a12,xe12,C12
}
 
f13(x) = D13*(1-exp(-a13*(x-xe13)))**2+C13
filename='pes_CIo3.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a13=1.0; xe13=STATS_pos_min_y; C13=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D13=last_y-C13
fit [xmin:xmax] [*:*] f13(x) filename u 1:($2) via D13,a13,xe13,C13
}
 
f14(x) = D14*(1-exp(-a14*(x-xe14)))**2+C14
filename='pes_CIo4.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a14=1.0; xe14=STATS_pos_min_y; C14=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D14=last_y-C14
fit [xmin:xmax] [*:*] f14(x) filename u 1:($2) via D14,a14,xe14,C14
}
 
f15(x) = D15*(1-exp(-a15*(x-xe15)))**2+C15
filename='pes_ooCIS.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a15=1.0; xe15=STATS_pos_min_y; C15=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D15=last_y-C15
fit [xmin:xmax] [*:*] f15(x) filename u 1:($2) via D15,a15,xe15,C15
}
 
f16(x) = D16*(1-exp(-a16*(x-xe16)))**2+C16
filename='pes_ooCISD.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a16=1.0; xe16=STATS_pos_min_y; C16=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D16=last_y-C16
fit [xmin:xmax] [*:*] f16(x) filename u 1:($2) via D16,a16,xe16,C16
}
 
f17(x) = D17*(1-exp(-a17*(x-xe17)))**2+C17
filename='pes_ooCISDT.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a17=1.0; xe17=STATS_pos_min_y; C17=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D17=last_y-C17
fit [xmin:xmax] [*:*] f17(x) filename u 1:($2) via D17,a17,xe17,C17
}
 
f18(x) = D18*(1-exp(-a18*(x-xe18)))**2+C18
filename='pes_ooCIs0.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a18=1.0; xe18=STATS_pos_min_y; C18=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D18=last_y-C18
fit [xmin:xmax] [*:*] f18(x) filename u 1:($2) via D18,a18,xe18,C18
}

f19(x) = D19*(1-exp(-a19*(x-xe19)))**2+C19
filename='pes_ooCIs2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a19=1.0; xe19=STATS_pos_min_y; C19=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D19=last_y-C19
fit [xmin:xmax] [*:*] f19(x) filename u 1:($2) via D19,a19,xe19,C19
}

f20(x) = D20*(1-exp(-a20*(x-xe20)))**2+C20
filename='pes_ooCIo1.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a20=1.0; xe20=STATS_pos_min_y; C20=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D20=last_y-C20
fit [xmin:xmax] [*:*] f20(x) filename u 1:($2) via D20,a20,xe20,C20
}

f21(x) = D21*(1-exp(-a21*(x-xe21)))**2+C21
filename='pes_ooCIo1.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a21=1.0; xe21=STATS_pos_min_y; C21=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D21=last_y-C21
fit [xmin:xmax] [*:*] f21(x) filename u 1:($2) via D21,a21,xe21,C21
}

f22(x) = D22*(1-exp(-a22*(x-xe22)))**2+C22
filename='pes_ooCIo2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a22=1.0; xe22=STATS_pos_min_y; C22=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D22=last_y-C22
fit [xmin:xmax] [*:*] f22(x) filename u 1:($2) via D22,a22,xe22,C22
}

f23(x) = D23*(1-exp(-a23*(x-xe23)))**2+C23
filename='pes_ooCIo2.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a23=1.0; xe23=STATS_pos_min_y; C23=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D23=last_y-C23
fit [xmin:xmax] [*:*] f23(x) filename u 1:($2) via D23,a23,xe23,C23
}

f24(x) = D24*(1-exp(-a24*(x-xe24)))**2+C24
filename='pes_ooCIo3.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a24=1.0; xe24=STATS_pos_min_y; C24=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D24=last_y-C24
fit [xmin:xmax] [*:*] f24(x) filename u 1:($2) via D24,a24,xe24,C24
}

###################################################################################
###################################################################################
# SYSTEM DEPENDENT PART:

plot 'pes_rhf.dat'       w lp ls 1  notitle, \
     'pes_CISD.dat'      w lp ls 3  notitle, \
     'pes_CISDT.dat'     w lp ls 3  notitle, \
     'pes_CISDTQ.dat'    w lp ls 3  notitle, \
     'pes_s0.dat'        w lp ls 8  notitle, \
     'pes_s2.dat'        w lp ls 8  notitle, \
     'pes_s4.dat'        w lp ls 8  notitle, \
     'pes_CIo1.dat'      w lp ls 4  notitle, \
     'pes_CIo1.5.dat'    w lp ls 5  notitle, \
     'pes_CIo2.dat'      w lp ls 4  notitle, \
     'pes_CIo2.5.dat'    w lp ls 5  notitle, \
     'pes_CIo3.dat'      w lp ls 4  notitle, \
     'pes_CIo3.5.dat'    w lp ls 5  notitle, \
     'pes_CIo4.dat'      w lp ls 4  notitle, \
     'pes_ooCIS.dat'     w lp ls 13 notitle, \
     'pes_ooCISD.dat'    w lp ls 13 notitle, \
     'pes_ooCISDT.dat'   w lp ls 13 notitle, \
     'pes_ooCIs0.dat'    w lp ls 18 notitle, \
     'pes_ooCIs2.dat'    w lp ls 18 notitle, \
     'pes_ooCIo1.dat'    w lp ls 14 notitle, \
     'pes_ooCIo1.5.dat'  w lp ls 15 notitle, \
     'pes_ooCIo2.dat'    w lp ls 14 notitle, \
     'pes_ooCIo2.5.dat'  w lp ls 15 notitle, \
     'pes_ooCIo3.dat'    w lp ls 14 notitle, \
     'pes_fci.dat'       w lp ls 2  notitle, \
     [xmin:xmax] f0(x)   w l  ls 9  notitle, \
     [xmin:xmax] f1(x)   w l  ls 9  notitle, \
     [xmin:xmax] f2(x)   w l  ls 9  notitle, \
     [xmin:xmax] f3(x)   w l  ls 9  notitle, \
     [xmin:xmax] f4(x)   w l  ls 9  notitle, \
     [xmin:xmax] f5(x)   w l  ls 9  notitle, \
     [xmin:xmax] f6(x)   w l  ls 9  notitle, \
     [xmin:xmax] f7(x)   w l  ls 9  notitle, \
     [xmin:xmax] f8(x)   w l  ls 9  notitle, \
     [xmin:xmax] f9(x)   w l  ls 9  notitle, \
     [xmin:xmax] f10(x)  w l  ls 9  notitle, \
     [xmin:xmax] f11(x)  w l  ls 9  notitle, \
     [xmin:xmax] f12(x)  w l  ls 9  notitle, \
     [xmin:xmax] f13(x)  w l  ls 9  notitle, \
     [xmin:xmax] f14(x)  w l  ls 9  notitle, \
     [xmin:xmax] f15(x)  w l  ls 9  notitle, \
     [xmin:xmax] f16(x)  w l  ls 9  notitle, \
     [xmin:xmax] f17(x)  w l  ls 9  notitle, \
     [xmin:xmax] f18(x)  w l  ls 9  notitle, \
     [xmin:xmax] f19(x)  w l  ls 9  notitle, \
     [xmin:xmax] f20(x)  w l  ls 9  notitle, \
     [xmin:xmax] f21(x)  w l  ls 9  notitle, \
     [xmin:xmax] f22(x)  w l  ls 9  notitle, \
     [xmin:xmax] f23(x)  w l  ls 9  notitle, \
     [xmin:xmax] f24(x)  w l  ls 9  notitle

###################################################################################
###################################################################################

pause -1
