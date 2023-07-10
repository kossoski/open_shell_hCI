#!/usr/bin/gnuplot
#

set terminal postscript eps size 16.0,9.0 enhanced color \
    font 'Helvetica,34' linewidth 2
set output 'determinants.eps'

set xrange[0.5:34.5]
set yrange[0.0:22.5]

unset xlabel
unset ylabel
unset xtics
unset ytics
unset border

#set style line  1  lt 1 lw 3 lc "dark-violet"
set style line  1  lt 1 lw 3 lc "gray10"
set style line  10 lt 1 lw 2 lc "black"
set style line  20 lt 1 lw 4 lc "black"
set style line  30 lt 1 lw 4 lc "medium-blue"
set style line  40 lt 1 lw 4 lc "red"
set style line  50 lt 1 lw 4 lc "sea-green"

set style arrow 1  head filled size screen 0.006,25,00 ls 1 lw 2
set style arrow 10 nohead ls 10

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
a3=3
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
a3=3
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


set label "reference\ndeterminant" at  0.5, 14.0 tc ls 10 font "Helvetica,34"
set label "hCI0"   at  1.1, 12.0 tc ls 50 font "Helvetica,34"
set label "hCI1"   at  6.1, 12.0 tc ls 50 font "Helvetica,34"

set label "reference\ndeterminant" at  14.5, 14.0 tc ls 10 font "Helvetica,34"
set label "hCI0"   at 15.1, 12.0 tc ls 50 font "Helvetica,34"
set label "hCI0.5" at 19.8, 12.0 tc ls 50 font "Helvetica,34"
set label "hCI1"   at 28.1, 12.0 tc ls 50 font "Helvetica,34"

set label "reference\ndeterminant" at  0.5, 2.0 tc ls 10 font "Helvetica,34"
set label "hCI0"   at  1.1,  0.0 tc ls 50 font "Helvetica,34"
set label "hCI0.5" at 12.1,  0.0 tc ls 50 font "Helvetica,34"
set label "hCI1"   at 25.1,  0.0 tc ls 50 font "Helvetica,34"

plot -1 notitle

#pause -1
