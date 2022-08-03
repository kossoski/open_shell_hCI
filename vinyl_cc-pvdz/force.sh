#!/bin/bash

gnuplot force.gnu
epspdf  force.eps
okular  force.pdf
