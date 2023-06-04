#!/bin/bash

#######################################################################

if [ -f "fit.log" ]; then
  rm "fit.log"
fi

gnuplot fit_eq.gnu

#######################################################################
grep ^a fit.log | grep = | sed 's/=//g' | cut -c -30 |
        sed 's/a0 /FCI      /g' |
        sed 's/a1 /RHF      /g' |
        sed 's/a2 /hfCISD   /g' |
        sed 's/a3 /hfCISDT  /g' |
        sed 's/a4 /hfCISDTQ /g' |
        sed 's/a5 /hfCIs0   /g' |
        sed 's/a6 /hfCIs2   /g' |
        sed 's/a7 /hfCIs4   /g' |
        sed 's/a8 /hfCIo1   /g' |
        sed 's/a9 /hfCIo1.5 /g' |
        sed 's/a10/hfCIo2   /g' |
        sed 's/a11/hfCIo2.5 /g' |
        sed 's/a12/hfCIo3   /g' |
        sed 's/a13/hfCIo3.5 /g' |
        sed 's/a14/hfCIo4   /g' |
        sed 's/a15/ooCIS    /g' |
        sed 's/a16/ooCISD   /g' |
        sed 's/a17/ooCISDT  /g' |
        sed 's/a18/ooCIs0   /g' |
        sed 's/a19/ooCIs2   /g' |
        sed 's/a20/ooCIo1   /g' |
        sed 's/a21/ooCIo1.5 /g' |
        sed 's/a22/ooCIo2   /g' |
        sed 's/a23/ooCIo2.5 /g' |
        sed 's/a24/ooCIo3   /g' > a.dat

grep ^D fit.log | grep = | sed 's/=//g' | cut -c -30 |
        sed 's/D0 /FCI      /g' |
        sed 's/D1 /RHF      /g' |
        sed 's/D2 /hfCISD   /g' |
        sed 's/D3 /hfCISDT  /g' |
        sed 's/D4 /hfCISDTQ /g' |
        sed 's/D5 /hfCIs0   /g' |
        sed 's/D6 /hfCIs2   /g' |
        sed 's/D7 /hfCIs4   /g' |
        sed 's/D8 /hfCIo1   /g' |
        sed 's/D9 /hfCIo1.5 /g' |
        sed 's/D10/hfCIo2   /g' |
        sed 's/D11/hfCIo2.5 /g' |
        sed 's/D12/hfCIo3   /g' |
        sed 's/D13/hfCIo3.5 /g' |
        sed 's/D14/hfCIo4   /g' |
        sed 's/D15/ooCIS    /g' |
        sed 's/D16/ooCISD   /g' |
        sed 's/D17/ooCISDT  /g' |
        sed 's/D18/ooCIs0   /g' |
        sed 's/D19/ooCIs2   /g' |
        sed 's/D20/ooCIo1   /g' |
        sed 's/D21/ooCIo1.5 /g' |
        sed 's/D22/ooCIo2   /g' |
        sed 's/D23/ooCIo2.5 /g' |
        sed 's/D24/ooCIo3   /g' > D.dat

paste a.dat D.dat > aD.dat

grep 'FCI' aD.dat | sed 's/FCI/-0.1 /g' >  aD_FCI.dat
grep 'FCI' aD.dat | sed 's/FCI/4.1 /g'  >> aD_FCI.dat

grep ^a fit.log | grep = | sed 's/=//g' | cut -c -30 > a0.dat
grep 'a0  ' a0.dat | sed 's/a0 /FCI      /g' >  a.dat
grep 'a1  ' a0.dat | sed 's/a1 /RHF      /g' >> a.dat
grep 'a1  ' a0.dat | sed 's/a1 /hfCIS    /g' >> a.dat
grep 'a2  ' a0.dat | sed 's/a2 /hfCISD   /g' >> a.dat
grep 'a3  ' a0.dat | sed 's/a3 /hfCISDT  /g' >> a.dat
grep 'a4  ' a0.dat | sed 's/a4 /hfCISDTQ /g' >> a.dat
grep 'a5  ' a0.dat | sed 's/a5 /hfCIs0   /g' >> a.dat
grep 'a6  ' a0.dat | sed 's/a6 /hfCIs2   /g' >> a.dat
grep 'a7  ' a0.dat | sed 's/a7 /hfCIs4   /g' >> a.dat
grep 'a8  ' a0.dat | sed 's/a8 /hfCIo1   /g' >> a.dat
grep 'a9  ' a0.dat | sed 's/a9 /hfCIo1.5 /g' >> a.dat
grep 'a10 ' a0.dat | sed 's/a10/hfCIo2   /g' >> a.dat
grep 'a11 ' a0.dat | sed 's/a11/hfCIo2.5 /g' >> a.dat
grep 'a12 ' a0.dat | sed 's/a12/hfCIo3   /g' >> a.dat
grep 'a13 ' a0.dat | sed 's/a13/hfCIo3.5 /g' >> a.dat
grep 'a14 ' a0.dat | sed 's/a14/hfCIo4   /g' >> a.dat
grep 'a15 ' a0.dat | sed 's/a15/ooCIS    /g' >> a.dat
grep 'a16 ' a0.dat | sed 's/a16/ooCISD   /g' >> a.dat
grep 'a17 ' a0.dat | sed 's/a17/ooCISDT  /g' >> a.dat
grep 'a18 ' a0.dat | sed 's/a18/ooCIs0   /g' >> a.dat
grep 'a19 ' a0.dat | sed 's/a19/ooCIs2   /g' >> a.dat
grep 'a20 ' a0.dat | sed 's/a20/ooCIo1   /g' >> a.dat
grep 'a21 ' a0.dat | sed 's/a21/ooCIo1.5 /g' >> a.dat
grep 'a22 ' a0.dat | sed 's/a22/ooCIo2   /g' >> a.dat
grep 'a23 ' a0.dat | sed 's/a23/ooCIo2.5 /g' >> a.dat
grep 'a24 ' a0.dat | sed 's/a24/ooCIo3   /g' >> a.dat

grep ^D fit.log | grep = | sed 's/=//g' | cut -c -30 > D0.dat
grep 'D0  ' D0.dat | sed 's/D0 /FCI      /g' >  D.dat
grep 'D1  ' D0.dat | sed 's/D1 /RHF      /g' >> D.dat
grep 'D1  ' D0.dat | sed 's/D1 /hfCIS    /g' >> D.dat
grep 'D2  ' D0.dat | sed 's/D2 /hfCISD   /g' >> D.dat
grep 'D3  ' D0.dat | sed 's/D3 /hfCISDT  /g' >> D.dat
grep 'D4  ' D0.dat | sed 's/D4 /hfCISDTQ /g' >> D.dat
grep 'D5  ' D0.dat | sed 's/D5 /hfCIs0   /g' >> D.dat
grep 'D6  ' D0.dat | sed 's/D6 /hfCIs2   /g' >> D.dat
grep 'D7  ' D0.dat | sed 's/D7 /hfCIs4   /g' >> D.dat
grep 'D8  ' D0.dat | sed 's/D8 /hfCIo1   /g' >> D.dat
grep 'D9  ' D0.dat | sed 's/D9 /hfCIo1.5 /g' >> D.dat
grep 'D10 ' D0.dat | sed 's/D10/hfCIo2   /g' >> D.dat
grep 'D11 ' D0.dat | sed 's/D11/hfCIo2.5 /g' >> D.dat
grep 'D12 ' D0.dat | sed 's/D12/hfCIo3   /g' >> D.dat
grep 'D13 ' D0.dat | sed 's/D13/hfCIo3.5 /g' >> D.dat
grep 'D14 ' D0.dat | sed 's/D14/hfCIo4   /g' >> D.dat
grep 'D15 ' D0.dat | sed 's/D15/ooCIS    /g' >> D.dat
grep 'D16 ' D0.dat | sed 's/D16/ooCISD   /g' >> D.dat
grep 'D17 ' D0.dat | sed 's/D17/ooCISDT  /g' >> D.dat
grep 'D18 ' D0.dat | sed 's/D18/ooCIs0   /g' >> D.dat
grep 'D19 ' D0.dat | sed 's/D19/ooCIs2   /g' >> D.dat
grep 'D20 ' D0.dat | sed 's/D20/ooCIo1   /g' >> D.dat
grep 'D21 ' D0.dat | sed 's/D21/ooCIo1.5 /g' >> D.dat
grep 'D22 ' D0.dat | sed 's/D22/ooCIo2   /g' >> D.dat
grep 'D23 ' D0.dat | sed 's/D23/ooCIo2.5 /g' >> D.dat
grep 'D24 ' D0.dat | sed 's/D24/ooCIo3   /g' >> D.dat

if [[ $(grep 'a0  ' a0.dat) ]]; then grep '0   ' det_FCI.dat | cut -c 4- >  det.dat; fi
if [[ $(grep 'a1  ' a0.dat) ]]; then grep '0   ' det_CI.dat  | cut -c 4- >> det.dat; fi
if [[ $(grep 'a1  ' a0.dat) ]]; then grep '1   ' det_CI.dat  | cut -c 4- >> det.dat; fi
if [[ $(grep 'a2  ' a0.dat) ]]; then grep '2   ' det_CI.dat  | cut -c 4- >> det.dat; fi
if [[ $(grep 'a3  ' a0.dat) ]]; then grep '3   ' det_CI.dat  | cut -c 4- >> det.dat; fi
if [[ $(grep 'a4  ' a0.dat) ]]; then grep '4   ' det_CI.dat  | cut -c 4- >> det.dat; fi
if [[ $(grep 'a5  ' a0.dat) ]]; then grep '0   ' det_CIs.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a6  ' a0.dat) ]]; then grep '2   ' det_CIs.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a7  ' a0.dat) ]]; then grep '4   ' det_CIs.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a8  ' a0.dat) ]]; then grep '1   ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a9  ' a0.dat) ]]; then grep '1.5 ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a10 ' a0.dat) ]]; then grep '2   ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a11 ' a0.dat) ]]; then grep '2.5 ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a12 ' a0.dat) ]]; then grep '3   ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a13 ' a0.dat) ]]; then grep '3.5 ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a14 ' a0.dat) ]]; then grep '4   ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a15 ' a0.dat) ]]; then grep '1   ' det_CI.dat  | cut -c 4- >> det.dat; fi
if [[ $(grep 'a16 ' a0.dat) ]]; then grep '2   ' det_CI.dat  | cut -c 4- >> det.dat; fi
if [[ $(grep 'a17 ' a0.dat) ]]; then grep '3   ' det_CI.dat  | cut -c 4- >> det.dat; fi
if [[ $(grep 'a18 ' a0.dat) ]]; then grep '0   ' det_CIs.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a19 ' a0.dat) ]]; then grep '2   ' det_CIs.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a20 ' a0.dat) ]]; then grep '1   ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a21 ' a0.dat) ]]; then grep '1.5 ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a22 ' a0.dat) ]]; then grep '2   ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a23 ' a0.dat) ]]; then grep '2.5 ' det_CIo.dat | cut -c 4- >> det.dat; fi
if [[ $(grep 'a24 ' a0.dat) ]]; then grep '3   ' det_CIo.dat | cut -c 4- >> det.dat; fi

paste det.dat a.dat D.dat > det_aD.dat

grep 'FCI'      det_aD.dat | sed 's/FCI/1 /g'     >  det_aD_FCI.dat
grep 'FCI'      det_aD.dat | sed 's/FCI/1.0E11/g' >> det_aD_FCI.dat

grep 'RHF'      det_aD.dat | sed 's/RHF/0 /g'      >  det_aD_CI.dat
grep 'hfCIS '   det_aD.dat | sed 's/hfCIS /1 /g'   >> det_aD_CI.dat
grep 'hfCISD '  det_aD.dat | sed 's/hfCISD /2 /g'  >> det_aD_CI.dat
grep 'hfCISDT ' det_aD.dat | sed 's/hfCISDT /3 /g' >> det_aD_CI.dat
grep 'hfCISDTQ' det_aD.dat | sed 's/hfCISDTQ/4 /g' >> det_aD_CI.dat

grep 'RHF'      det_aD.dat | sed 's/RHF/0 /g'      >  det_aD_ooCI.dat
grep 'ooCIS '   det_aD.dat | sed 's/ooCIS /1 /g'   >> det_aD_ooCI.dat
grep 'ooCISD '  det_aD.dat | sed 's/ooCISD /2 /g'  >> det_aD_ooCI.dat
grep 'ooCISDT ' det_aD.dat | sed 's/ooCISDT /3 /g' >> det_aD_ooCI.dat

grep 'hfCIs0 ' det_aD.dat | sed 's/hfCIs0/0 /g' >  det_aD_CIs.dat
grep 'hfCIs2 ' det_aD.dat | sed 's/hfCIs2/2 /g' >> det_aD_CIs.dat
grep 'hfCIs4 ' det_aD.dat | sed 's/hfCIs4/4 /g' >> det_aD_CIs.dat

grep 'ooCIs0 ' det_aD.dat | sed 's/ooCIs0/0 /g' >  det_aD_ooCIs.dat
grep 'ooCIs2 ' det_aD.dat | sed 's/ooCIs2/2 /g' >> det_aD_ooCIs.dat

grep 'RHF'      det_aD.dat | sed 's/RHF/0 /g'        >  det_aD_CIo.dat
grep 'hfCIo1 '  det_aD.dat | sed 's/hfCIo1/1 /g'     >> det_aD_CIo.dat
grep 'hfCIo1.5' det_aD.dat | sed 's/hfCIo1.5/1.5 /g' >> det_aD_CIo.dat
grep 'hfCIo2 '  det_aD.dat | sed 's/hfCIo2/2 /g'     >> det_aD_CIo.dat
grep 'hfCIo2.5' det_aD.dat | sed 's/hfCIo2.5/2.5 /g' >> det_aD_CIo.dat
grep 'hfCIo3 '  det_aD.dat | sed 's/hfCIo3/3 /g'     >> det_aD_CIo.dat
grep 'hfCIo3.5' det_aD.dat | sed 's/hfCIo3.5/3.5 /g' >> det_aD_CIo.dat
grep 'hfCIo4 '  det_aD.dat | sed 's/hfCIo4/4 /g'     >> det_aD_CIo.dat

grep 'RHF'      det_aD.dat | sed 's/RHF/0 /g'        >  det_aD_ooCIo.dat
grep 'ooCIo1 '  det_aD.dat | sed 's/ooCIo1/1 /g'     >> det_aD_ooCIo.dat
grep 'ooCIo1.5' det_aD.dat | sed 's/ooCIo1.5/1.5 /g' >> det_aD_ooCIo.dat
grep 'ooCIo2 '  det_aD.dat | sed 's/ooCIo2/2 /g'     >> det_aD_ooCIo.dat
grep 'ooCIo2.5' det_aD.dat | sed 's/ooCIo2.5/2.5 /g' >> det_aD_ooCIo.dat
grep 'ooCIo3 '  det_aD.dat | sed 's/ooCIo3/3 /g'     >> det_aD_ooCIo.dat

#######################################################################

#######################################################################
grep ^xe fit.log | grep = | sed 's/=//g' | cut -c -30 > xe0.dat

grep ^xe fit.log | grep = | sed 's/=//g' | cut -c -30 |
        sed 's/xe0 /FCI      /g' |
        sed 's/xe1 /RHF      /g' |
        sed 's/xe2 /hfCISD   /g' |
        sed 's/xe3 /hfCISDT  /g' |
        sed 's/xe4 /hfCISDTQ /g' |
        sed 's/xe5 /hfCIs0   /g' |
        sed 's/xe6 /hfCIs2   /g' |
        sed 's/xe7 /hfCIs4   /g' |
        sed 's/xe8 /hfCIo1   /g' |
        sed 's/xe9 /hfCIo1.5 /g' |
        sed 's/xe10/hfCIo2   /g' |
        sed 's/xe11/hfCIo2.5 /g' |
        sed 's/xe12/hfCIo3   /g' |
        sed 's/xe13/hfCIo3.5 /g' |
        sed 's/xe14/hfCIo4   /g' |
        sed 's/xe15/ooCIS    /g' |
        sed 's/xe16/ooCISD   /g' |
        sed 's/xe17/ooCISDT  /g' |
        sed 's/xe18/ooCIs0   /g' |
        sed 's/xe19/ooCIs2   /g' |
        sed 's/xe20/ooCIo1   /g' |
        sed 's/xe21/ooCIo1.5 /g' |
        sed 's/xe22/ooCIo2   /g' |
        sed 's/xe23/ooCIo2.5 /g' |
        sed 's/xe24/ooCIo3   /g' > xe.dat

grep ^xe fit.log | grep = | sed 's/=//g' | cut -c -30 > xe0.dat
grep 'xe0  ' xe0.dat | sed 's/xe0 /FCI      /g' >  xe.dat
grep 'xe1  ' xe0.dat | sed 's/xe1 /RHF      /g' >> xe.dat
grep 'xe1  ' xe0.dat | sed 's/xe1 /hfCIS    /g' >> xe.dat
grep 'xe2  ' xe0.dat | sed 's/xe2 /hfCISD   /g' >> xe.dat
grep 'xe3  ' xe0.dat | sed 's/xe3 /hfCISDT  /g' >> xe.dat
grep 'xe4  ' xe0.dat | sed 's/xe4 /hfCISDTQ /g' >> xe.dat
grep 'xe5  ' xe0.dat | sed 's/xe5 /hfCIs0   /g' >> xe.dat
grep 'xe6  ' xe0.dat | sed 's/xe6 /hfCIs2   /g' >> xe.dat
grep 'xe7  ' xe0.dat | sed 's/xe7 /hfCIs4   /g' >> xe.dat
grep 'xe8  ' xe0.dat | sed 's/xe8 /hfCIo1   /g' >> xe.dat
grep 'xe9  ' xe0.dat | sed 's/xe9 /hfCIo1.5 /g' >> xe.dat
grep 'xe10 ' xe0.dat | sed 's/xe10/hfCIo2   /g' >> xe.dat
grep 'xe11 ' xe0.dat | sed 's/xe11/hfCIo2.5 /g' >> xe.dat
grep 'xe12 ' xe0.dat | sed 's/xe12/hfCIo3   /g' >> xe.dat
grep 'xe13 ' xe0.dat | sed 's/xe13/hfCIo3.5 /g' >> xe.dat
grep 'xe14 ' xe0.dat | sed 's/xe14/hfCIo4   /g' >> xe.dat
grep 'xe15 ' xe0.dat | sed 's/xe15/ooCIS    /g' >> xe.dat
grep 'xe16 ' xe0.dat | sed 's/xe16/ooCISD   /g' >> xe.dat
grep 'xe17 ' xe0.dat | sed 's/xe17/ooCISDT  /g' >> xe.dat
grep 'xe18 ' xe0.dat | sed 's/xe18/ooCIs0   /g' >> xe.dat
grep 'xe19 ' xe0.dat | sed 's/xe19/ooCIs2   /g' >> xe.dat
grep 'xe20 ' xe0.dat | sed 's/xe20/ooCIo1   /g' >> xe.dat
grep 'xe21 ' xe0.dat | sed 's/xe21/ooCIo1.5 /g' >> xe.dat
grep 'xe22 ' xe0.dat | sed 's/xe22/ooCIo2   /g' >> xe.dat
grep 'xe23 ' xe0.dat | sed 's/xe23/ooCIo2.5 /g' >> xe.dat
grep 'xe24 ' xe0.dat | sed 's/xe24/ooCIo3   /g' >> xe.dat

paste det.dat xe.dat D.dat > det_xe.dat

grep 'FCI' det_xe.dat | sed 's/FCI/1 /g'   >  det_xe_FCI.dat
grep 'FCI' det_xe.dat | sed 's/FCI/1E11/g' >> det_xe_FCI.dat

grep 'RHF'      det_xe.dat | sed 's/RHF/0 /g'      >  det_xe_CI.dat
grep 'hfCIS '   det_xe.dat | sed 's/hfCIS /1 /g'   >> det_xe_CI.dat
grep 'hfCISD '  det_xe.dat | sed 's/hfCISD /2 /g'  >> det_xe_CI.dat
grep 'hfCISDT ' det_xe.dat | sed 's/hfCISDT /3 /g' >> det_xe_CI.dat
grep 'hfCISDTQ' det_xe.dat | sed 's/hfCISDTQ/4 /g' >> det_xe_CI.dat

grep 'RHF'      det_xe.dat | sed 's/RHF/0 /g'      >  det_xe_ooCI.dat
grep 'ooCIS '   det_xe.dat | sed 's/ooCIS /1 /g'   >> det_xe_ooCI.dat
grep 'ooCISD '  det_xe.dat | sed 's/ooCISD /2 /g'  >> det_xe_ooCI.dat
grep 'ooCISDT ' det_xe.dat | sed 's/ooCISDT /3 /g' >> det_xe_ooCI.dat

grep 'hfCIs0 ' det_xe.dat | sed 's/hfCIs0/0 /g' >  det_xe_CIs.dat
grep 'hfCIs2 ' det_xe.dat | sed 's/hfCIs2/2 /g' >> det_xe_CIs.dat
grep 'hfCIs4 ' det_xe.dat | sed 's/hfCIs4/4 /g' >> det_xe_CIs.dat

grep 'ooCIs0 ' det_xe.dat | sed 's/ooCIs0/0 /g' >  det_xe_ooCIs.dat
grep 'ooCIs2 ' det_xe.dat | sed 's/ooCIs2/2 /g' >> det_xe_ooCIs.dat

grep 'RHF'      det_xe.dat | sed 's/RHF/0 /g'        >  det_xe_CIo.dat
grep 'hfCIo1 '  det_xe.dat | sed 's/hfCIo1/1 /g'     >> det_xe_CIo.dat
grep 'hfCIo1.5' det_xe.dat | sed 's/hfCIo1.5/1.5 /g' >> det_xe_CIo.dat
grep 'hfCIo2 '  det_xe.dat | sed 's/hfCIo2/2 /g'     >> det_xe_CIo.dat
grep 'hfCIo2.5' det_xe.dat | sed 's/hfCIo2.5/2.5 /g' >> det_xe_CIo.dat
grep 'hfCIo3 '  det_xe.dat | sed 's/hfCIo3/3 /g'     >> det_xe_CIo.dat
grep 'hfCIo3.5' det_xe.dat | sed 's/hfCIo3.5/3.5 /g' >> det_xe_CIo.dat
grep 'hfCIo4 '  det_xe.dat | sed 's/hfCIo4/4 /g'     >> det_xe_CIo.dat

grep 'RHF'      det_xe.dat | sed 's/RHF/0 /g'        >  det_xe_ooCIo.dat
grep 'ooCIo1 '  det_xe.dat | sed 's/ooCIo1/1 /g'     >> det_xe_ooCIo.dat
grep 'ooCIo1.5' det_xe.dat | sed 's/ooCIo1.5/1.5 /g' >> det_xe_ooCIo.dat
grep 'ooCIo2 '  det_xe.dat | sed 's/ooCIo2/2 /g'     >> det_xe_ooCIo.dat
grep 'ooCIo2.5' det_xe.dat | sed 's/ooCIo2.5/2.5 /g' >> det_xe_ooCIo.dat
grep 'ooCIo3 '  det_xe.dat | sed 's/ooCIo3/3 /g'     >> det_xe_ooCIo.dat

#######################################################################

#epspdf fit_eq.eps
#okular fit_eq.pdf
