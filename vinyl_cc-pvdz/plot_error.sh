#!/bin/bash

gnuplot plot_error.gnu
epspdf plot_error.eps
okular plot_error.pdf
