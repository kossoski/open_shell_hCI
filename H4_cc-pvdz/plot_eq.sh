#!/bin/bash

grep ^xe fit.log | grep = | sed 's/=//g' | cut -c -30 | 
	sed 's/xe0 /FCI   /g' |
	sed 's/xe1 /RHF   /g' |
	sed 's/xe2 /SD    /g' |
	sed 's/xe3 /SDT   /g' |
	sed 's/xe4 /SDTQ  /g' |
	sed 's/xe5 /o1    /g' |
	sed 's/xe6 /o1.5  /g' |
	sed 's/xe7 /o2    /g' |
	sed 's/xe8 /o2.5  /g' |
	sed 's/xe9 /o3    /g' |
	sed 's/xe10/o3.5  /g' |
	sed 's/xe11/o4    /g' |
	sed 's/xe12/ooSD  /g' |
	sed 's/xe13/ooSDT /g' |
	sed 's/xe14/ooo1  /g' |
	sed 's/xe15/ooo1.5/g' |
	sed 's/xe16/ooo2  /g' |
	sed 's/xe17/ooo2.5/g' |
	sed 's/xe18/ooo3  /g' #|

