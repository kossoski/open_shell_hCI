#!/usr/bin/gnuplot
#

set terminal postscript eps size 9.0,5.0 enhanced color \
    font 'Helvetica,44' linewidth 2
set output 'determinants_appendix.eps'

set xrange[ 0.3:10.3]
set yrange[13.5:22.5]

unset xlabel
unset ylabel
unset xtics
unset ytics
unset border

rgb(r,g,b) = 65536 * int(r) + 256 * int(g) + int(b)

set style line  1  lt 1 lw 3 lc rgbcolor rgb(186, 19, 26)
set style line  10 lt 1 lw 5 lc "black"
set style line  20 lt 1 lw 5 lc "black"
set style line  30 lt 1 lw 4 lc "medium-blue"
set style line  40 lt 1 lw 4 lc "red"

set style line  50 lt 1 lw 4 lc rgbcolor rgb(101,194,149)
set style line  60 lt 1 lw 4 lc rgbcolor rgb(  0,166, 93)
set style line  70 lt 1 lw 4 lc rgbcolor rgb(  0,108, 59)
set style line  80 lt 1 lw 4 lc rgbcolor rgb(  0,  0,  0)

set style arrow 1  head filled   size screen 0.013,30,00 ls 1 lw 8
set style arrow 2  head nofilled size screen 0.009,30,00 ls 10 lw 3
set style arrow 10 nohead ls 10
set style arrow 20 nohead ls 20

set style arrow 5  heads filled size screen 0.0025,90,00 ls 50 lw 8
set style arrow 6  heads filled size screen 0.0025,90,00 ls 60 lw 8
set style arrow 7  heads filled size screen 0.0025,90,00 ls 70 lw 8
set style arrow 8  heads filled size screen 0.0080,90,00 ls 60 lw 6

al=0.8 # arrowlength
dx=1.0
dy=4.0
nx=2.0 # spacing between the xi of each set

al2=al/2

# FIRST BLOCK
xi=-1.0
yi=14.0

# CLOSED-SHELL
##################################################################################################################################
a1=1
a2=2
a3=3
b1=1
b2=2
b3=3

xi=xi+nx
xf=xi+dx
yf=yi+dy
p3x=(xf-xi)/3
p3y=(yf-yi)/3
set arrow from xi,yi+  p3y to xf,yi+  p3y as 10
set arrow from xi,yi+2*p3y to xf,yi+2*p3y as 10
set arrow from xi,yi+3*p3y to xf,yi+3*p3y as 10
set arrow from xi,yi+4*p3y to xf,yi+4*p3y as 10
set arrow from xi,yi+5*p3y to xf,yi+5*p3y as 10
set arrow from xi,yi+6*p3y to xf,yi+6*p3y as 10
set arrow from xi+  p3x,yi+a1*p3y-al2 to xi+  p3x,yi+a1*p3y+al2 as 1
set arrow from xi+  p3x,yi+a2*p3y-al2 to xi+  p3x,yi+a2*p3y+al2 as 1
set arrow from xi+  p3x,yi+a3*p3y-al2 to xi+  p3x,yi+a3*p3y+al2 as 1
set arrow from xi+2*p3x,yi+b1*p3y+al2 to xi+2*p3x,yi+b1*p3y-al2 as 1
set arrow from xi+2*p3x,yi+b2*p3y+al2 to xi+2*p3x,yi+b2*p3y-al2 as 1
set arrow from xi+2*p3x,yi+b3*p3y+al2 to xi+2*p3x,yi+b3*p3y-al2 as 1
##################################################################################################################################
xi=xi+nx

# ONE UNPAIRED
##################################################################################################################################
a1=1
a2=2
a3=3
b1=1
b2=2

xi=xi+nx
xf=xi+dx
yf=yi+dy
p3x=(xf-xi)/3
p3y=(yf-yi)/3
set arrow from xi,yi+  p3y to xf,yi+  p3y as 10
set arrow from xi,yi+2*p3y to xf,yi+2*p3y as 10
set arrow from xi,yi+3*p3y to xf,yi+3*p3y as 10
set arrow from xi,yi+4*p3y to xf,yi+4*p3y as 10
set arrow from xi,yi+5*p3y to xf,yi+5*p3y as 10
set arrow from xi,yi+6*p3y to xf,yi+6*p3y as 10
set arrow from xi+  p3x,yi+a1*p3y-al2 to xi+  p3x,yi+a1*p3y+al2 as 1
set arrow from xi+  p3x,yi+a2*p3y-al2 to xi+  p3x,yi+a2*p3y+al2 as 1
set arrow from xi+  p3x,yi+a3*p3y-al2 to xi+  p3x,yi+a3*p3y+al2 as 1
set arrow from xi+2*p3x,yi+b1*p3y+al2 to xi+2*p3x,yi+b1*p3y-al2 as 1
set arrow from xi+2*p3x,yi+b2*p3y+al2 to xi+2*p3x,yi+b2*p3y-al2 as 1
##################################################################################################################################
xi=xi+nx

# GENERAL
##################################################################################################################################
a1=1
a2=2
a3=3
b1=1
b2=4

xi=xi+nx
xf=xi+dx
yf=yi+dy
p3x=(xf-xi)/3
p3y=(yf-yi)/3
set arrow from xi,yi+  p3y to xf,yi+  p3y as 10
set arrow from xi,yi+2*p3y to xf,yi+2*p3y as 10
set arrow from xi,yi+3*p3y to xf,yi+3*p3y as 10
set arrow from xi,yi+4*p3y to xf,yi+4*p3y as 10
set arrow from xi,yi+5*p3y to xf,yi+5*p3y as 10
set arrow from xi,yi+6*p3y to xf,yi+6*p3y as 10
set arrow from xi+  p3x,yi+a1*p3y-al2 to xi+  p3x,yi+a1*p3y+al2 as 1
set arrow from xi+  p3x,yi+a2*p3y-al2 to xi+  p3x,yi+a2*p3y+al2 as 1
set arrow from xi+  p3x,yi+a3*p3y-al2 to xi+  p3x,yi+a3*p3y+al2 as 1
set arrow from xi+2*p3x,yi+b1*p3y+al2 to xi+2*p3x,yi+b1*p3y-al2 as 1
set arrow from xi+2*p3x,yi+b2*p3y+al2 to xi+2*p3x,yi+b2*p3y-al2 as 1
##################################################################################################################################

set label "{/Helvetica-Italic s}_0 = 0 \nreference"       at  0.9, 14.0 tc ls 10 font "Helvetica,44"
set label "{/Helvetica-Italic s}_0 = 1 \nreference"       at  4.9, 14.0 tc ls 10 font "Helvetica,44"
set label "{/Helvetica-Italic s}_0 = {/Helvetica-Italic N}_s + {/Helvetica-Italic N}_s \nreference"   at  8.55, 14.0 tc ls 10 font "Helvetica,44"
set arrow                                 from    9.75, 14.07 to 9.75, 14.50 as 2
set arrow                                 from   10.62, 14.50 to 10.62, 14.07 as 2

set label "{/Helvetica-Italic N/2}"         at -0.15, 16.8 tc ls 10 font "Helvetica,44"
set arrow                                 from   0.6, 15.0 to 0.6, 18.5 as 8
set label "{/Helvetica-Italic K}"           at   2.5, 18.7 tc ls 10 font "Helvetica,44"
set arrow                                 from   2.4, 15.0 to 2.4, 22.5 as 8

set label "{/Helvetica-Italic N  = N}  -1"  at  2.85, 16.00 tc ls 10 font "Helvetica,44"
set arrow                                 from  4.07, 16.07 to 4.07, 16.50 as 2
set arrow                                 from  3.26, 16.50 to 3.26, 16.07 as 2
set arrow                                 from   4.6, 15.0  to 4.6, 17.2 as 8
set label "1"                               at   4.3, 17.9  tc ls 10 font "Helvetica,44"
set arrow                                 from   4.6, 17.4  to 4.6, 18.5 as 8
set label "{/Helvetica-Italic K}"           at   6.5, 18.7  tc ls 10 font "Helvetica,44"
set arrow                                 from   6.4, 15.0  to 6.4, 22.5 as 8

set label "{/Helvetica-Italic N}_d"         at   7.9, 15.5  tc ls 10 font "Helvetica,44"
set arrow                                 from   8.6, 15.0  to 8.6, 16.0 as 8
set label "{/Helvetica-Italic N}_s"         at   7.9, 17.3  tc ls 10 font "Helvetica,44"
set arrow                                 from  8.30, 17.37 to 8.30, 17.80 as 2
set arrow                                 from   8.6, 16.2  to 8.6, 18.5 as 8
set label "{/Helvetica-Italic N}_s"         at   7.9, 19.3  tc ls 10 font "Helvetica,44"
set arrow                                 from  8.30, 19.80 to 8.30, 19.37 as 2
set arrow                                 from   8.6, 18.7  to 8.6, 20.0 as 8
set label "{/Helvetica-Italic K}"           at  10.5, 18.7  tc ls 10 font "Helvetica,44"
set arrow                                 from  10.4, 15.0  to 10.4, 22.5 as 8

plot -1 notitle

#pause -1
