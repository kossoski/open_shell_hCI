#!/usr/bin/gnuplot
#

set terminal postscript eps size 1.5,7.0 enhanced color \
    font 'Helvetica,40' linewidth 2
set output 'det_2open.eps'

set xrange[1.2: 1.8]
set yrange[15.0:23.0]

unset xlabel
unset ylabel
unset xtics
unset ytics
unset border

rgb(r,g,b) = 65536 * int(r) + 256 * int(g) + int(b)

set style line  1  lt 1 lw 3 lc rgbcolor rgb(186, 19, 26)
set style line  10 lt 1 lw 3 lc "black"
set style line  20 lt 1 lw 5 lc "black"
set style line  30 lt 1 lw 4 lc "medium-blue"
set style line  40 lt 1 lw 4 lc "red"

set style line  50 lt 1 lw 4 lc rgbcolor rgb(101,194,149)
set style line  60 lt 1 lw 4 lc rgbcolor rgb(  0,166, 93)
set style line  70 lt 1 lw 4 lc rgbcolor rgb(  0,108, 59)

set style arrow 1  head filled size screen 0.14,25,00 ls 1 lw 8
set style arrow 10 nohead ls 10
set style arrow 20 nohead ls 20

set style arrow 5  heads filled size screen 0.0025,90,00 ls 50 lw 7
set style arrow 6  heads filled size screen 0.0025,90,00 ls 60 lw 7
set style arrow 7  heads filled size screen 0.0025,90,00 ls 70 lw 7

al=0.8 # arrowlength
dx=1.0
dy=4.0
nx=2.0 # spacing between the xi of each set

al2=al/2

xi=-1.0
yi=14.0

##################################################################################################################################
a1=1
a2=2
a3=4
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

plot -1 notitle

#pause -1
