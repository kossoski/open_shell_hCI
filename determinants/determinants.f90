program determinants
implicit none

integer*16 :: o, v
integer*16 :: e, k
integer*16 :: n, m

integer*16 :: s0d0
integer*16 ::       s2d1
integer*16 :: s0d2, s2d2, s4d2
integer*16 ::       s2d3, s4d3, s6d3
integer*16 :: s0d4, s2d4, s4d4, s6d4, s8d4
integer*16 ::       s2d5, s4d5, s6d5
integer*16 :: s0d6, s2d6, s4d6
integer*16 ::       s2d7
integer*16 :: s0d8

integer*16 :: rhf, fci
integer*16 :: cis0, cis2, cis4, cis6
integer*16 :: cis, cisd, cisdt, cisdtq
integer*16 :: cio1, cio1p5, cio2, cio2p5, cio3, cio3p5, cio4

integer :: nunit
character(len=8), parameter :: fmt1 = "(*(i16))"
character(len=8), parameter :: fmt2 = "(a,i16)"

character(len=32) :: filename

!!!!!!!!!!!!!!!!!!!!!!!
read(*,*) e, k
!!!!!!!!!!!!!!!!!!!!!!!

o = e/2
v = k - o

!!!!!!!!!!!!!!!!!!!!!!!
call binomial_coefficient(k,o,m)
! CIs0
cis0 = m
! CIs2
cis2 = cis0 + m*o*v
! CIs4
cis4 = cis2 + m*o*(o-1)*v*(v-1)/4
! CIs6
cis6 = cis4 + m*o*(o-1)*(o-2)*v*(v-1)*(v-2)/36
!!!!!!!!!!!!!!!!!!!!!!!

filename = 'det_CIs.dat'
open(newunit=nunit,file=filename,status='unknown')
  write(nunit,fmt2) '0   ', cis0
  write(nunit,fmt2) '2   ', cis2
  write(nunit,fmt2) '4   ', cis4
  write(nunit,fmt2) '6   ', cis6
close(nunit)

!!!!!!!!!!!!!!!!!!!!!!!

s0d0 = 1

s0d2 = o*v

s0d4 = o*(o-1)*v*(v-1)/4

s0d6 = o*(o-1)*(o-2)*v*(v-1)*(v-2)/36

s0d8 = o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)*(v-3)/400

!!!!!!!!!!!!!!!!!!!!!!!

s2d1 = 2*o*v

!s2d2 = o      *v*(v-1) + &
!       o*(o-1)*v
s2d2 = o*v*(o+v-2)

s2d3 = 2*o*(o-1)*v*(v-1)

!s2d4 = o*(o-1)      *v*(v-1)*(v-2)/2 + &
!       o*(o-1)*(o-2)*v*(v-1)      /2
s2d4 = o*(o-1)*v*(v-1)*(o+v-4)/2

s2d5 = o*(o-1)*(o-2)*v*(v-1)*(v-2)/2

!s2d6 = o*(o-1)*(o-2)      *v*(v-1)*(v-2)*(v-3)/12 + &
!       o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)      /12 
s2d6 = o*(o-1)*(o-2)*v*(v-1)*(v-2)*(o+v-6)/12

s2d7 = o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)*(v-3)/18

!!!!!!!!!!!!!!!!!!!!!!!

s4d2 = o*(o-1)*v*(v-1)*3/2

!s4d3 = o*(o-1)      *v*(v-1)*(v-2) + &
!       o*(o-1)*(o-2)*v*(v-1)
s4d3 = o*(o-1)*v*(v-1)*(o+v-4)

!s4d4 = o*(o-1)            *v*(v-1)*(v-2)*(v-3)/8   + &
!       o*(o-1)*(o-2)      *v*(v-1)*(v-2)      *3/2 + &
!       o*(o-1)*(o-2)*(o-3)*v*(v-1)            /8 
s4d4 = o*(o-1)*v*(v-1) * ( (v-2)*(v-3) + (o-2)*(o-3) + 12*(o-2)*(v-2) )/8

!s4d5 = o*(o-1)*(o-2)      *v*(v-1)*(v-2)*(v-3)/2 + &
!       o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)      /2 
s4d5 = o*(o-1)*(o-2)*v*(v-1)*(v-2)*(o+v-6)/2

!s4d6 = o*(o-1)*(o-2)            *v*(v-1)*(v-2)*(v-3)*(v-4)/24  + &
!       o*(o-1)*(o-2)*(o-3)      *v*(v-1)*(v-2)*(v-3)      *3/8 + &
!       o*(o-1)*(o-2)*(o-3)*(o-4)*v*(v-1)*(v-2)            /24 
s4d6 = o*(o-1)*(o-2)*v*(v-1)*(v-2) * ( (o-3)*(o-4) + (v-3)*(v-4) + 3*(o-3)*(v-3) )/24

!!!!!!!!!!!!!!!!!!!!!!!

s6d3 = o*(o-1)*(o-2)*v*(v-1)*(v-2)*5/9

!s6d4 = o*(o-1)*(o-2)      *v*(v-1)*(v-2)*(v-3)*5/12 + &
!       o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)      *5/12
s6d4 = o*(o-1)*(o-2)*v*(v-1)*(v-2)*(o+v-6)*5/12

s6d5 = o*(o-1)*(o-2)            *v*(v-1)*(v-2)*(v-3)*(v-4)/12  + &
       o*(o-1)*(o-2)*(o-3)      *v*(v-1)*(v-2)*(v-3)      *5/9 +  &
       o*(o-1)*(o-2)*(o-3)*(o-4)*v*(v-1)*(v-2)            /12
!s6d5 = o*(o-1)*(o-2)*v*(v-1)*(v-2) * ( 3*(o-3)*(o-4) + 3*(v-3)*(v-4) + 20*(o-3)*(v-3) )/36

!!!!!!!!!!!!!!!!!!!!!!!

s8d4 = o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)*(v-3)*35/288

!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!
! HF
rhf = s0d0
! CIo1
cio1 = rhf + s0d2 + s2d1
! CIo1.5
cio1p5 = cio1 + s2d2
! CIo2
cio2 = cio1p5 + s0d4 + s2d3 + s4d2
! CIo2.5
cio2p5 = cio2 + s2d4 + s4d3
! CIo3
cio3 = cio2p5 + s0d6 + s2d5 + s4d4 + s6d3
! CIo3.5
cio3p5 = cio3 + s2d6 + s4d5 + s6d4
! CIo4
cio4 = cio3p5 + s0d8 + s2d7 + s4d6 + s6d5 + s8d4

filename = 'det_CIo.dat'
open(newunit=nunit,file=filename,status='unknown')
  write(nunit,fmt2) '0   ', rhf
  write(nunit,fmt2) '1   ', cio1
  write(nunit,fmt2) '1.5 ', cio1p5
  write(nunit,fmt2) '2   ', cio2
  write(nunit,fmt2) '2.5 ', cio2p5
  write(nunit,fmt2) '3   ', cio3
  write(nunit,fmt2) '3.5 ', cio3p5
  write(nunit,fmt2) '4   ', cio4
close(nunit)

!!!!!!!!!!!!!!!!!!!!!!!
! HF
rhf = s0d0
! CIS
cis = rhf + s2d1
! CISD
cisd = cis + s0d2 + s2d2 + s4d2
! CISDT
cisdt = cisd + s2d3 + s4d3 + s6d3
! CISDTQ
cisdtq = cisdt + s0d4 + s2d4 + s4d4 + s8d4

filename = 'det_CI.dat'
open(newunit=nunit,file=filename,status='unknown')
  write(nunit,fmt2) '0   ', rhf
  write(nunit,fmt2) '1   ', cis
  write(nunit,fmt2) '2   ', cisd
  write(nunit,fmt2) '3   ', cisdt
  write(nunit,fmt2) '4   ', cisdtq
close(nunit)

!!!!!!!!!!!!!!!!!!!!!!!

call binomial_coefficient(k,o,m)

fci = m*m

filename = 'det_FCI.dat'
open(newunit=nunit,file=filename,status='unknown')
  write(nunit,fmt2) '0   ', fci
close(nunit)

!!!!!!!!!!!!!!!!!!!!!!!

filename = 'det.dat'
open(newunit=nunit,file=filename,status='unknown')
  write(nunit,fmt2) 'FCI    ', fci
  write(nunit,fmt2) 'RHF    ', rhf
  write(nunit,fmt2) 'CIS    ', cis
  write(nunit,fmt2) 'CISD   ', cisd
  write(nunit,fmt2) 'CISDT  ', cisdt
  write(nunit,fmt2) 'CISDTQ ', cisdtq
  write(nunit,fmt2) 'CIs0   ', cis0
  write(nunit,fmt2) 'CIs2   ', cis2
  write(nunit,fmt2) 'CIs4   ', cis4
  write(nunit,fmt2) 'CIo1   ', cio1
  write(nunit,fmt2) 'CIo1.5 ', cio1p5
  write(nunit,fmt2) 'CIo2   ', cio2
  write(nunit,fmt2) 'CIo2.5 ', cio2p5
  write(nunit,fmt2) 'CIo3   ', cio3
  write(nunit,fmt2) 'CIo3.5 ', cio3p5
  write(nunit,fmt2) 'CIo4   ', cio4
close(nunit)

!!!!!!!!!!!!!!!!!!!!!!!

filename = 'table.dat'
open(newunit=nunit,file=filename,status='unknown')
  write(nunit,fmt1) s0d0
  write(nunit,fmt1)    0, s2d1
  write(nunit,fmt1) s0d2, s2d2, s4d2
  write(nunit,fmt1)    0, s2d3, s4d3, s6d3
  write(nunit,fmt1) s0d4, s2d4, s4d4, s6d4, s8d4
  write(nunit,fmt1)    0, s2d5, s4d5, s6d5
  write(nunit,fmt1) s0d6, s2d6, s4d6
  write(nunit,fmt1)    0, s2d7
  write(nunit,fmt1) s0d8
close(nunit)

end program determinants

subroutine binomial_coefficient(n,k,c)
        implicit none
        ! (n k) = n!/((n-k)!k!)
        integer*16, intent(in)  :: n, k
        integer*16, intent(out) :: c
        integer :: i
        real*8 :: cr
        cr = 1.0d0
        do i=1,k
          cr = cr * real( n+1-i) / real( i )
        end do
        c = int( cr )
end subroutine binomial_coefficient
