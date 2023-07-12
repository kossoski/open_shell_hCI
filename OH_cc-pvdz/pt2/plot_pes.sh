#!/bin/bash

gnuplot plot_pes.gnu
epspdf plot_pes.eps
okular plot_pes.pdf
