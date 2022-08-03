#!/bin/bash

if [ -f "fit.log" ]; then
  rm "fit.log"
fi

gnuplot fit_eq.gnu

grep ^xe fit.log | grep = | sed 's/=//g' | cut -c -30 |
        sed 's/xe0 /FCI      /g' |
        sed 's/xe1 /RHF      /g' |
        sed 's/xe2 /hfCISD   /g' |
        sed 's/xe3 /hfCISDT  /g' |
        sed 's/xe4 /hfCISDTQ /g' |
        sed 's/xe5 /hfCIo1   /g' |
        sed 's/xe6 /hfCIo1.5 /g' |
        sed 's/xe7 /hfCIo2   /g' |
        sed 's/xe8 /hfCIo2.5 /g' |
        sed 's/xe9 /hfCIo3   /g' |
        sed 's/xe10/hfCIo3.5 /g' |
        sed 's/xe11/hfCIo4   /g' |
        sed 's/xe12/ooCISD   /g' |
        sed 's/xe13/ooCISDT  /g' |
        sed 's/xe14/ooCIo1   /g' |
        sed 's/xe15/ooCIo1.5 /g' |
        sed 's/xe16/ooCIo2   /g' |
        sed 's/xe17/ooCIo2.5 /g' |
        sed 's/xe18/ooCIo3   /g' > xe.dat


grep 'FCI' xe.dat | sed 's/FCI/-0.1 /g' >  xe_FCI.dat
grep 'FCI' xe.dat | sed 's/FCI/4.1 /g'  >> xe_FCI.dat

grep 'RHF'      xe.dat | sed 's/RHF/0 /g'      >  xe_CI.dat
grep 'RHF'      xe.dat | sed 's/RHF/1 /g'      >> xe_CI.dat
grep 'hfCISD '  xe.dat | sed 's/hfCISD/2 /g'   >> xe_CI.dat
grep 'hfCISDT ' xe.dat | sed 's/hfCISDT/3 /g'  >> xe_CI.dat
grep 'hfCISDTQ' xe.dat | sed 's/hfCISDTQ/4 /g' >> xe_CI.dat

grep 'RHF'     xe.dat | sed 's/RHF/0 /g'     >  xe_ooCI.dat
grep 'RHF'     xe.dat | sed 's/RHF/1 /g'     >> xe_ooCI.dat
grep 'ooCISD ' xe.dat | sed 's/ooCISD/2 /g'  >> xe_ooCI.dat
grep 'ooCISDT' xe.dat | sed 's/ooCISDT/3 /g' >> xe_ooCI.dat

grep 'RHF'      xe.dat | sed 's/RHF/0 /g'        >  xe_CIo.dat
grep 'hfCIo1 '  xe.dat | sed 's/hfCIo1/1 /g'     >> xe_CIo.dat
grep 'hfCIo1.5' xe.dat | sed 's/hfCIo1.5/1.5 /g' >> xe_CIo.dat
grep 'hfCIo2 '  xe.dat | sed 's/hfCIo2/2 /g'     >> xe_CIo.dat
grep 'hfCIo2.5' xe.dat | sed 's/hfCIo2.5/2.5 /g' >> xe_CIo.dat
grep 'hfCIo3 '  xe.dat | sed 's/hfCIo3/3 /g'     >> xe_CIo.dat
grep 'hfCIo3.5' xe.dat | sed 's/hfCIo3.5/3.5 /g' >> xe_CIo.dat
grep 'hfCIo4 '  xe.dat | sed 's/hfCIo4/4 /g'     >> xe_CIo.dat

grep 'RHF'      xe.dat | sed 's/RHF/0 /g'        >  xe_ooCIo.dat
grep 'ooCIo1 '  xe.dat | sed 's/ooCIo1/1 /g'     >> xe_ooCIo.dat
grep 'ooCIo1.5' xe.dat | sed 's/ooCIo1.5/1.5 /g' >> xe_ooCIo.dat
grep 'ooCIo2 '  xe.dat | sed 's/ooCIo2/2 /g'     >> xe_ooCIo.dat
grep 'ooCIo2.5' xe.dat | sed 's/ooCIo2.5/2.5 /g' >> xe_ooCIo.dat
grep 'ooCIo3 '  xe.dat | sed 's/ooCIo3/3 /g'     >> xe_ooCIo.dat

#epspdf fit_eq.eps
#okular fit_eq.pdf
