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
delx=0.15

set xrange[0.5:6.0]

# VIEW 1:
set yrange[-100.25:-99.85]
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

set xlabel "Distance ({\305})"
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
xmin0=0.8;xmax0=1.1
xmin1=0.8;xmax1=1.1
xmin2=0.8;xmax2=1.1
xmin3=0.8;xmax3=1.1
xmin4=0.8;xmax4=1.1
xmin5=0.8;xmax5=1.1
xmin6=0.8;xmax6=1.1
xmin7=0.8;xmax7=1.1
xmin8=0.8;xmax8=1.1
xmin9=0.8;xmax9=1.1
xmin10=0.8;xmax10=1.1
xmin11=0.8;xmax11=1.1
xmin12=0.8;xmax12=1.1
xmin13=0.8;xmax13=1.1
xmin14=0.8;xmax14=1.1
xmin15=0.8;xmax15=1.1
xmin16=0.8;xmax16=1.1
xmin17=0.8;xmax17=1.1
xmin18=0.8;xmax18=1.1
xmin19=0.8;xmax19=1.1
xmin20=0.8;xmax20=1.1
xmin21=0.8;xmax21=1.1
xmin22=0.8;xmax22=1.1
xmin23=0.8;xmax23=1.1
xmin24=0.8;xmax24=1.1

# function for fitting
 
f0(x) = D0*(1-exp(-a0*(x-xe0)))**2+C0
filename='pes_fci.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a0=1.0; xe0=STATS_pos_min_y; C0=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D0=last_y-C0
xmin0=xe0-delx
xmax0=xe0+delx
fit [xmin0:xmax0] [*:*] f0(x) filename u 1:($2) via D0,a0,xe0,C0
}

f1(x) = D1*(1-exp(-a1*(x-xe1)))**2+C1
filename='pes_rhf.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a1=1.0; xe1=STATS_pos_min_y; C1=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D1=last_y-C1
xmin1=xe1-delx
xmax1=xe1+delx
fit [xmin1:xmax1] [*:*] f1(x) filename u 1:($2) via D1,a1,xe1,C1
}
 
f2(x) = D2*(1-exp(-a2*(x-xe2)))**2+C2
filename='pes_CISD.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a2=1.0; xe2=STATS_pos_min_y; C2=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D2=last_y-C2
xmin2=xe2-delx
xmax2=xe2+delx
fit [xmin2:xmax2] [*:*] f2(x) filename u 1:($2) via D2,a2,xe2,C2
}
 
f3(x) = D3*(1-exp(-a3*(x-xe3)))**2+C3
filename='pes_CISDT.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a3=1.0; xe3=STATS_pos_min_y; C3=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D3=last_y-C3
xmin3=xe3-delx
xmax3=xe3+delx
fit [xmin3:xmax3] [*:*] f3(x) filename u 1:($2) via D3,a3,xe3,C3
}
 
f4(x) = D4*(1-exp(-a4*(x-xe4)))**2+C4
filename='pes_CISDTQ.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a4=1.0; xe4=STATS_pos_min_y; C4=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D4=last_y-C4
xmin4=xe4-delx
xmax4=xe4+delx
fit [xmin4:xmax4] [*:*] f4(x) filename u 1:($2) via D4,a4,xe4,C4
}
 
f5(x) = D5*(1-exp(-a5*(x-xe5)))**2+C5
filename='pes_s0.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a5=1.0; xe5=STATS_pos_min_y; C5=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D5=last_y-C5
xmin5=xe5-delx
xmax5=xe5+delx
fit [xmin5:xmax5] [*:*] f5(x) filename u 1:($2) via D5,a5,xe5,C5
}
 
f6(x) = D6*(1-exp(-a6*(x-xe6)))**2+C6
filename='pes_s2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a6=1.0; xe6=STATS_pos_min_y; C6=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D6=last_y-C6
xmin6=xe6-delx
xmax6=xe6+delx
fit [xmin6:xmax6] [*:*] f6(x) filename u 1:($2) via D6,a6,xe6,C6
}
 
f7(x) = D7*(1-exp(-a7*(x-xe7)))**2+C7
filename='pes_s4.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a7=1.0; xe7=STATS_pos_min_y; C7=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D7=last_y-C7
xmin7=xe7-delx
xmax7=xe7+delx
fit [xmin7:xmax7] [*:*] f7(x) filename u 1:($2) via D7,a7,xe7,C7
}
 
f8(x) = D8*(1-exp(-a8*(x-xe8)))**2+C8
filename='pes_CIo1.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a8=1.0; xe8=STATS_pos_min_y; C8=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D8=last_y-C8
xmin8=xe8-delx
xmax8=xe8+delx
fit [xmin8:xmax8] [*:*] f8(x) filename u 1:($2) via D8,a8,xe8,C8
}
 
f9(x) = D9*(1-exp(-a9*(x-xe9)))**2+C9
filename='pes_CIo1.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a9=1.0; xe9=STATS_pos_min_y; C9=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D9=last_y-C9
xmin9=xe9-delx
xmax9=xe9+delx
fit [xmin9:xmax9] [*:*] f9(x) filename u 1:($2) via D9,a9,xe9,C9
}
 
f10(x) = D10*(1-exp(-a10*(x-xe10)))**2+C10
filename='pes_CIo2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a10=1.0; xe10=STATS_pos_min_y; C10=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D10=last_y-C10
xmin10=xe10-delx
xmax10=xe10+delx
fit [xmin10:xmax10] [*:*] f10(x) filename u 1:($2) via D10,a10,xe10,C10
}
 
f11(x) = D11*(1-exp(-a11*(x-xe11)))**2+C11
filename='pes_CIo2.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a11=1.0; xe11=STATS_pos_min_y; C11=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D11=last_y-C11
xmin11=xe11-delx
xmax11=xe11+delx
fit [xmin11:xmax11] [*:*] f11(x) filename u 1:($2) via D11,a11,xe11,C11
}
 
f12(x) = D12*(1-exp(-a12*(x-xe12)))**2+C12
filename='pes_CIo3.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a12=1.0; xe12=STATS_pos_min_y; C12=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D12=last_y-C12
xmin12=xe12-delx
xmax12=xe12+delx
fit [xmin12:xmax12] [*:*] f12(x) filename u 1:($2) via D12,a12,xe12,C12
}
 
f13(x) = D13*(1-exp(-a13*(x-xe13)))**2+C13
filename='pes_CIo3.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a13=1.0; xe13=STATS_pos_min_y; C13=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D13=last_y-C13
xmin13=xe13-delx
xmax13=xe13+delx
fit [xmin13:xmax13] [*:*] f13(x) filename u 1:($2) via D13,a13,xe13,C13
}
 
f14(x) = D14*(1-exp(-a14*(x-xe14)))**2+C14
filename='pes_CIo4.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a14=1.0; xe14=STATS_pos_min_y; C14=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D14=last_y-C14
xmin14=xe14-delx
xmax14=xe14+delx
fit [xmin14:xmax14] [*:*] f14(x) filename u 1:($2) via D14,a14,xe14,C14
}
 
f15(x) = D15*(1-exp(-a15*(x-xe15)))**2+C15
filename='pes_ooCIS.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a15=1.0; xe15=STATS_pos_min_y; C15=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D15=last_y-C15
xmin15=xe15-delx
xmax15=xe15+delx
fit [xmin15:xmax15] [*:*] f15(x) filename u 1:($2) via D15,a15,xe15,C15
}
 
f16(x) = D16*(1-exp(-a16*(x-xe16)))**2+C16
filename='pes_ooCISD.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a16=1.0; xe16=STATS_pos_min_y; C16=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D16=last_y-C16
xmin16=xe16-delx
xmax16=xe16+delx
fit [xmin16:xmax16] [*:*] f16(x) filename u 1:($2) via D16,a16,xe16,C16
}
 
f17(x) = D17*(1-exp(-a17*(x-xe17)))**2+C17
filename='pes_ooCISDT.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a17=1.0; xe17=STATS_pos_min_y; C17=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D17=last_y-C17
xmin17=xe17-delx
xmax17=xe17+delx
fit [xmin17:xmax17] [*:*] f17(x) filename u 1:($2) via D17,a17,xe17,C17
}
 
f18(x) = D18*(1-exp(-a18*(x-xe18)))**2+C18
filename='pes_ooCIs0.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a18=1.0; xe18=STATS_pos_min_y; C18=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D18=last_y-C18
xmin18=xe18-delx
xmax18=xe18+delx
fit [xmin18:xmax18] [*:*] f18(x) filename u 1:($2) via D18,a18,xe18,C18
}

f19(x) = D19*(1-exp(-a19*(x-xe19)))**2+C19
filename='pes_ooCIs2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a19=1.0; xe19=STATS_pos_min_y; C19=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D19=last_y-C19
xmin19=xe19-delx
xmax19=xe19+delx
fit [xmin19:xmax19] [*:*] f19(x) filename u 1:($2) via D19,a19,xe19,C19
}

f20(x) = D20*(1-exp(-a20*(x-xe20)))**2+C20
filename='pes_ooCIo1.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a20=1.0; xe20=STATS_pos_min_y; C20=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D20=last_y-C20
xmin20=xe20-delx
xmax20=xe20+delx
fit [xmin20:xmax20] [*:*] f20(x) filename u 1:($2) via D20,a20,xe20,C20
}

f21(x) = D21*(1-exp(-a21*(x-xe21)))**2+C21
filename='pes_ooCIo1.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a21=1.0; xe21=STATS_pos_min_y; C21=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D21=last_y-C21
xmin21=xe21-delx
xmax21=xe21+delx
fit [xmin21:xmax21] [*:*] f21(x) filename u 1:($2) via D21,a21,xe21,C21
}

f22(x) = D22*(1-exp(-a22*(x-xe22)))**2+C22
filename='pes_ooCIo2.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a22=1.0; xe22=STATS_pos_min_y; C22=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D22=last_y-C22
xmin22=xe22-delx
xmax22=xe22+delx
fit [xmin22:xmax22] [*:*] f22(x) filename u 1:($2) via D22,a22,xe22,C22
}

f23(x) = D23*(1-exp(-a23*(x-xe23)))**2+C23
filename='pes_ooCIo2.5.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a23=1.0; xe23=STATS_pos_min_y; C23=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D23=last_y-C23
xmin23=xe23-delx
xmax23=xe23+delx
fit [xmin23:xmax23] [*:*] f23(x) filename u 1:($2) via D23,a23,xe23,C23
}

f24(x) = D24*(1-exp(-a24*(x-xe24)))**2+C24
filename='pes_ooCIo3.dat'
if ( file_exists(filename) ){
stats filename using 1:2 nooutput
a24=1.0; xe24=STATS_pos_min_y; C24=STATS_min_y
stats filename using 1:(last_y=$2) every ::STATS_records-1::STATS_records-1 nooutput
D24=last_y-C24
xmin24=xe24-delx
xmax24=xe24+delx
fit [xmin24:xmax24] [*:*] f24(x) filename u 1:($2) via D24,a24,xe24,C24
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
     [xmin0:xmax0] f0(x)   w l  ls 9  notitle, \
     [xmin1:xmax1] f1(x)   w l  ls 9  notitle, \
     [xmin2:xmax2] f2(x)   w l  ls 9  notitle, \
     [xmin3:xmax3] f3(x)   w l  ls 9  notitle, \
     [xmin4:xmax4] f4(x)   w l  ls 9  notitle, \
     [xmin5:xmax5] f5(x)   w l  ls 9  notitle, \
     [xmin6:xmax6] f6(x)   w l  ls 9  notitle, \
     [xmin7:xmax7] f7(x)   w l  ls 9  notitle, \
     [xmin8:xmax8] f8(x)   w l  ls 9  notitle, \
     [xmin9:xmax9] f9(x)   w l  ls 9  notitle, \
     [xmin10:xmax10] f10(x)  w l  ls 9  notitle, \
     [xmin11:xmax11] f11(x)  w l  ls 9  notitle, \
     [xmin12:xmax12] f12(x)  w l  ls 9  notitle, \
     [xmin13:xmax13] f13(x)  w l  ls 9  notitle, \
     [xmin14:xmax14] f14(x)  w l  ls 9  notitle, \
     [xmin15:xmax15] f15(x)  w l  ls 9  notitle, \
     [xmin16:xmax16] f16(x)  w l  ls 9  notitle, \
     [xmin17:xmax17] f17(x)  w l  ls 9  notitle, \
     [xmin18:xmax18] f18(x)  w l  ls 9  notitle, \
     [xmin19:xmax19] f19(x)  w l  ls 9  notitle, \
     [xmin20:xmax20] f20(x)  w l  ls 9  notitle, \
     [xmin21:xmax21] f21(x)  w l  ls 9  notitle, \
     [xmin22:xmax22] f22(x)  w l  ls 9  notitle, \
     [xmin23:xmax23] f23(x)  w l  ls 9  notitle, \
     [xmin24:xmax24] f24(x)  w l  ls 9  notitle

###################################################################################
###################################################################################

pause -1
