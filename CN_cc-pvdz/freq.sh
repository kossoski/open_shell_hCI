#!/bin/bash

gnuplot freq.gnu
epspdf  freq.eps
okular  freq.pdf
