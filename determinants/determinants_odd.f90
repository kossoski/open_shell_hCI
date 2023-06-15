program determinants_odd
implicit none

integer*16 :: o, v
integer*16 :: e, k
integer*16 :: n, m

integer*16 :: s1d0
integer*16 ::       s3d1
integer*16 :: s1d2, s3d2, s5d2
integer*16 ::       s3d3, s5d3, s7d3
integer*16 :: s1d4, s3d4, s5d4, s7d4, s9d4
integer*16 ::       s3d5, s5d5, s7d5
integer*16 :: s1d6, s3d6, s5d6
integer*16 ::       s3d7
integer*16 :: s1d8

integer*16 :: rhf, fci
integer*16 :: cis1, cis3, cis5, cis7
integer*16 :: cis, cisd, cisdt, cisdtq
integer*16 :: cio1, cio1p5, cio2, cio2p5, cio3, cio3p5, cio4

integer :: nunit
character(len=8), parameter :: fmt1 = "(*(i16))"
character(len=8), parameter :: fmt2 = "(a,i16)"

character(len=32) :: filename

!!!!!!!!!!!!!!!!!!!!!!!
read(*,*) e, k
!!!!!!!!!!!!!!!!!!!!!!!

!o = e/2
o = (e-1)/2
v = k - o

!!!!!!!!!!!!!!!!!!!!!!!
call binomial_coefficient(k,o,m)
! CIs1
cis1 = m
! CIs3
cis3 = cis1 + m*o*v
! CIs5
cis5 = cis3 + m*o*(o-1)*v*(v-1)/4
! CIs7
cis7 = cis5 + m*o*(o-1)*(o-2)*v*(v-1)*(v-2)/36
!!!!!!!!!!!!!!!!!!!!!!!

filename = 'det_CIs.dat'
open(newunit=nunit,file=filename,status='unknown')
  write(nunit,fmt2) '1   ', cis1
  write(nunit,fmt2) '3   ', cis3
  write(nunit,fmt2) '5   ', cis5
  write(nunit,fmt2) '7   ', cis7
close(nunit)

!!!!!!!!!!!!!!!!!!!!!!!

s1d0 = 1

s1d2 = o*v

s1d4 = o*(o-1)*v*(v-1)/4

s1d6 = o*(o-1)*(o-2)*v*(v-1)*(v-2)/36

s1d8 = o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)*(v-3)/400

!!!!!!!!!!!!!!!!!!!!!!!

s3d1 = 2*o*v

!s3d2 = o      *v*(v-1) + &
!       o*(o-1)*v
s3d2 = o*v*(o+v-2)

s3d3 = 2*o*(o-1)*v*(v-1)

!s3d4 = o*(o-1)      *v*(v-1)*(v-2)/2 + &
!       o*(o-1)*(o-2)*v*(v-1)      /2
s3d4 = o*(o-1)*v*(v-1)*(o+v-4)/2

s3d5 = o*(o-1)*(o-2)*v*(v-1)*(v-2)/2

!s3d6 = o*(o-1)*(o-2)      *v*(v-1)*(v-2)*(v-3)/12 + &
!       o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)      /12 
s3d6 = o*(o-1)*(o-2)*v*(v-1)*(v-2)*(o+v-6)/12

s3d7 = o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)*(v-3)/18

!!!!!!!!!!!!!!!!!!!!!!!

s5d2 = o*(o-1)*v*(v-1)*3/2

!s5d3 = o*(o-1)      *v*(v-1)*(v-2) + &
!       o*(o-1)*(o-2)*v*(v-1)
s5d3 = o*(o-1)*v*(v-1)*(o+v-4)

!s5d4 = o*(o-1)            *v*(v-1)*(v-2)*(v-3)/8   + &
!       o*(o-1)*(o-2)      *v*(v-1)*(v-2)      *3/2 + &
!       o*(o-1)*(o-2)*(o-3)*v*(v-1)            /8 
s5d4 = o*(o-1)*v*(v-1) * ( (v-2)*(v-3) + (o-2)*(o-3) + 12*(o-2)*(v-2) )/8

!s5d5 = o*(o-1)*(o-2)      *v*(v-1)*(v-2)*(v-3)/2 + &
!       o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)      /2 
s5d5 = o*(o-1)*(o-2)*v*(v-1)*(v-2)*(o+v-6)/2

!s5d6 = o*(o-1)*(o-2)            *v*(v-1)*(v-2)*(v-3)*(v-4)/24  + &
!       o*(o-1)*(o-2)*(o-3)      *v*(v-1)*(v-2)*(v-3)      *3/8 + &
!       o*(o-1)*(o-2)*(o-3)*(o-4)*v*(v-1)*(v-2)            /24 
s5d6 = o*(o-1)*(o-2)*v*(v-1)*(v-2) * ( (o-3)*(o-4) + (v-3)*(v-4) + 3*(o-3)*(v-3) )/24

!!!!!!!!!!!!!!!!!!!!!!!

s7d3 = o*(o-1)*(o-2)*v*(v-1)*(v-2)*5/9

!s7d4 = o*(o-1)*(o-2)      *v*(v-1)*(v-2)*(v-3)*5/12 + &
!       o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)      *5/12
s7d4 = o*(o-1)*(o-2)*v*(v-1)*(v-2)*(o+v-6)*5/12

s7d5 = o*(o-1)*(o-2)            *v*(v-1)*(v-2)*(v-3)*(v-4)/12  + &
       o*(o-1)*(o-2)*(o-3)      *v*(v-1)*(v-2)*(v-3)      *5/9 +  &
       o*(o-1)*(o-2)*(o-3)*(o-4)*v*(v-1)*(v-2)            /12
!s7d5 = o*(o-1)*(o-2)*v*(v-1)*(v-2) * ( 3*(o-3)*(o-4) + 3*(v-3)*(v-4) + 20*(o-3)*(v-3) )/36

!!!!!!!!!!!!!!!!!!!!!!!

s9d4 = o*(o-1)*(o-2)*(o-3)*v*(v-1)*(v-2)*(v-3)*35/288

!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!
! HF
rhf = s1d0
! CIo1
cio1 = rhf + s1d2 + s3d1
! CIo1.5
cio1p5 = cio1 + s3d2
! CIo2
cio2 = cio1p5 + s1d4 + s3d3 + s5d2
! CIo2.5
cio2p5 = cio2 + s3d4 + s5d3
! CIo3
cio3 = cio2p5 + s1d6 + s3d5 + s5d4 + s7d3
! CIo3.5
cio3p5 = cio3 + s3d6 + s5d5 + s7d4
! CIo4
cio4 = cio3p5 + s1d8 + s3d7 + s5d6 + s7d5 + s9d4

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
rhf = s1d0
! CIS
cis = rhf + s3d1
! CISD
cisd = cis + s1d2 + s3d2 + s5d2
! CISDT
cisdt = cisd + s3d3 + s5d3 + s7d3
! CISDTQ
cisdtq = cisdt + s1d4 + s3d4 + s5d4 + s9d4

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
  write(nunit,fmt2) 'CIs1   ', cis1
  write(nunit,fmt2) 'CIs3   ', cis3
  write(nunit,fmt2) 'CIs5   ', cis5
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
  write(nunit,fmt1) s1d0
  write(nunit,fmt1)    0, s3d1
  write(nunit,fmt1) s1d2, s3d2, s5d2
  write(nunit,fmt1)    0, s3d3, s5d3, s7d3
  write(nunit,fmt1) s1d4, s3d4, s5d4, s7d4, s9d4
  write(nunit,fmt1)    0, s3d5, s5d5, s7d5
  write(nunit,fmt1) s1d6, s3d6, s5d6
  write(nunit,fmt1)    0, s3d7
  write(nunit,fmt1) s1d8
close(nunit)

end program determinants_odd

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
