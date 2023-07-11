#!/usr/bin/gnuplot
#

set terminal postscript eps size 16.0,9.0 enhanced color \
    font 'Helvetica,40' linewidth 2
set output 'determinants.eps'

set xrange[0.5:34.5]
set yrange[0.0:22.5]

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

set style arrow 1  head filled size screen 0.006,25,00 ls 1 lw 2
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

# FIRST BLOCK
xi=-1.0
yi=14.0

# CLOSED-SHELL
# SET 1
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

# SET 2
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

# SET 3
##################################################################################################################################
a1=1
a2=2
a3=4
b1=1
b2=2
b3=4

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

xi=xi+3*nx

# ONE UNPAIRED
# SET 4
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

# SET 5
##################################################################################################################################
a1=1
a2=2
a3=4
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

# SET 6
##################################################################################################################################
a1=1
a2=4
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
xi=xi+nx

# SET 7
##################################################################################################################################
a1=1
a2=4
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

# SET 8
##################################################################################################################################
a1=1
a2=4
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

# SET 9
##################################################################################################################################
a1=1
a2=4
a3=3
b1=1
b2=3

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

# SET 10
##################################################################################################################################
a1=1
a2=4
a3=2
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

# SECOND BLOCK
xi=-1.0
yi=2.0

# TWO UNPAIRED
# SET 1
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
xi=xi+nx

# SET 2
##################################################################################################################################
a1=1
a2=2
a3=4
b1=1
b2=2
b3=4

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

# SET 3
##################################################################################################################################
a1=1
a2=2
a3=5
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

# SET 4
##################################################################################################################################
a1=1
a2=2
a3=4
b1=1
b2=3
b3=4

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

# SET 5
##################################################################################################################################
a1=1
a2=4
a3=3
b1=1
b2=4
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

# SET 6
##################################################################################################################################
a1=1
a2=2
a3=5
b1=1
b2=2
b3=5

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

# SET 7
##################################################################################################################################
a1=1
a2=4
a3=5
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

# SET 8
##################################################################################################################################
a1=1
a2=4
a3=5
b1=1
b2=3
b3=5

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

# SET 9
##################################################################################################################################
a1=1
a2=2
a3=6
b1=1
b2=2
b3=5

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

# SET 10
##################################################################################################################################
a1=2
a2=3
a3=4
b1=1
b2=3
b3=4

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

# SET 11
##################################################################################################################################
a1=1
a2=3
a3=4
b1=1
b2=3
b3=5

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

# SET 12
##################################################################################################################################
a1=1
a2=3
a3=6
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

# SET 13
##################################################################################################################################
a1=1
a2=4
a3=5
b1=1
b2=4
b3=5

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

# SET 14
##################################################################################################################################
a1=1
a2=2
a3=5
b1=1
b2=3
b3=5

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


set label "reference"       at  0.3, 14.2 tc ls 10 font "Helvetica,40"
set label "{/:Bold hCI0}"   at  0.9, 12.0 tc ls 50 font "Helvetica,40"
set arrow                  from 0.1, 12.5 to 3.1,12.5 as 5
set label "{/:Bold hCI1}"   at  5.9, 12.0 tc ls 70 font "Helvetica,40"
set arrow                  from 0.1, 13.1 to 8.1,13.1 as 7

set label "reference"       at  14.3, 14.2 tc ls 10 font "Helvetica,40"
set label "{/:Bold hCI0}"   at 14.9, 12.0 tc ls 50 font "Helvetica,40"
set arrow                 from 14.1, 12.5 to 17.1,12.5 as 5
set label "{/:Bold hCI0.5}" at 19.6, 12.0 tc ls 60 font "Helvetica,40"
set arrow                 from 14.1, 12.8 to 23.1,12.8 as 6
set label "{/:Bold hCI1}"   at 27.9, 12.0 tc ls 70 font "Helvetica,40"
set arrow                 from 14.1, 13.1 to 33.1,13.1 as 7

set label "reference"       at  0.3, 2.2 tc ls 10 font "Helvetica,40"
set label "{/:Bold hCI0}"   at  3.1,  0.0 tc ls 50 font "Helvetica,40"
set arrow                 from  0.1,  0.5 to  7.1, 0.5 as 5
set label "{/:Bold hCI0.5}" at 11.6,  0.0 tc ls 60 font "Helvetica,40"
set arrow                 from  0.1,  0.8 to  17.1, 0.8 as 6
set label "{/:Bold hCI1}"   at 25.9,  0.0 tc ls 70 font "Helvetica,40"
set arrow                 from  0.1,  1.1 to  35.1, 1.1 as 7

set arrow                  from -1.0, 11.3 to 37.0,11.3 as 20
set arrow                  from 11.5, 11.3 to 11.5,24.0 as 20

plot -1 notitle

#pause -1
