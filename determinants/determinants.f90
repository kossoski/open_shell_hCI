program determinants
  implicit none

  integer*16 :: na, nb  ! Number of alpha electrons, Number of beta electrons
  integer*16 :: k       ! Number of spatial orbitals

  logical    :: closed_shell = .false.
  integer*16 :: va, vb  ! Number of alpha virtual orbitals, Number of beta virtual orbitals
  integer*16 :: n, o, v ! For closed-shells, number of electrons, occupied orbitals, and virtual orbitals
  integer*16 :: s0      ! Seniority of the reference determinant
  integer*16 :: rhf, fci, sCI(4), eCI(4), hCI(8), hCI_bl(8,8)

  character(len=8), parameter :: fmt1 = "(*(i16))"
  character(len=8), parameter :: fmt2 = "(a,i16)"
  character(len=32) :: filename
  integer :: nunit

  call read_input

  call det_sCI

  call det_eCI

  call det_hCI

  call det_fci

  call print_all_det

contains

!-------------------------------------
subroutine read_input
  implicit none

  read(*,*) na, nb, k

  if( nb.gt.na ) stop 'The number of alpha electrons should be greater than or equal to the number of beta electrons'

  if( na == nb ) closed_shell = .true.

  if( closed_shell ) then
    n = na*2
    o = na
    v = k - o
  else
    va = k - na
    vb = k - nb
  end if

! Assuming a single HF reference
  rhf = 1

  s0 = na - nb

end subroutine read_input
!-------------------------------------

!-------------------------------------
subroutine det_sCI
  implicit none

  sCI = 0

  if( closed_shell ) then
    call det_sCI_closed
  else
    call det_sCI_open
  end if

  sCI(2) = sCI(2) + sCI(1)
  sCI(3) = sCI(3) + sCI(2)
  sCI(4) = sCI(4) + sCI(3)

  filename = 'det_CIs.dat'

  if( closed_shell ) then
     open(newunit=nunit,file=filename,status='unknown')
      write(nunit,fmt2) '0   ', sCI(1)
      write(nunit,fmt2) '2   ', sCI(2)
      write(nunit,fmt2) '4   ', sCI(3)
      write(nunit,fmt2) '6   ', sCI(4)
    close(nunit)
  else
    open(newunit=nunit,file=filename,status='unknown')
      write(nunit,fmt2) '1   ', sCI(1)
      write(nunit,fmt2) '3   ', sCI(2)
      write(nunit,fmt2) '5   ', sCI(3)
       write(nunit,fmt2) '7   ', sCI(4)
    close(nunit)
  end if

end subroutine det_sCI
!-------------------------------------

!-------------------------------------
subroutine det_sCI_closed
  implicit none
  integer*16 :: s  ! Seniority of the determinant
  integer*16 :: nd ! Number of doubly occupied orbitals
  integer*16 :: i  ! Index of the seniority
  integer*16 :: tmp1, tmp2

  call binomial_coefficient(k,o,tmp1)
  do i=1,4
    s = s0 + 2*(i-1)
    nd = (n - s) / 2
    if( nd.lt.0 ) cycle
    call binomial_coefficient(o,nd,tmp2)
    call binomial_coefficient(v,o-nd,sCI(i))
    sCI(i) = sCI(i) * tmp1 * tmp2
  end do

end subroutine det_sCI_closed
!-------------------------------------

!-------------------------------------
subroutine det_sCI_open
  implicit none
  integer*16 :: s  ! Seniority of the determinant
  integer*16 :: nd ! Number of doubly occupied orbitals
  integer*16 :: i
  integer*16 :: tmp1, tmp2

  call binomial_coefficient(k,na,tmp1)
  do i=1,4
    s = s0 + 2*(i-1)
    nd = (na + nb - s) / 2
    if( nd.lt.0 ) cycle
    call binomial_coefficient(na,nd,tmp2)
    call binomial_coefficient(va,nb-nd,sCI(i))
    sCI(i) = sCI(i) * tmp1 * tmp2
  end do

end subroutine det_sCI_open
!-------------------------------------

!-------------------------------------
subroutine det_hCI
  implicit none

  hCI    = 0
  hCI_bl = 0

  if( closed_shell ) then
    call det_hCI_closed
  else
    call det_hCI_open
  end if

  hCI(1) = hCI_bl(1,1)
  hCI(2) = hCI_bl(1,2) + hCI_bl(2,1)
  hCI(3) =               hCI_bl(2,2) + hCI_bl(3,1)
  hCI(4) =               hCI_bl(2,3) + hCI_bl(3,2) + hCI_bl(4,1)
  hCI(5) =                             hCI_bl(3,3) + hCI_bl(4,2) + hCI_bl(5,1)
  hCI(6) =                             hCI_bl(3,4) + hCI_bl(4,3) + hCI_bl(5,2) + hCI_bl(6,1)
  hCI(7) =                                           hCI_bl(4,4) + hCI_bl(5,3) + hCI_bl(6,2) + hCI_bl(7,1)
  hCI(8) =                                           hCI_bl(4,5) + hCI_bl(5,4) + hCI_bl(6,3) + hCI_bl(7,2) + hCI_bl(8,1)

  hCI(1) = hCI(1) + rhf
  hCI(2) = hCI(2) + hCI(1)
  hCI(3) = hCI(3) + hCI(2)
  hCI(4) = hCI(4) + hCI(3)
  hCI(5) = hCI(5) + hCI(4)
  hCI(6) = hCI(6) + hCI(5)
  hCI(7) = hCI(7) + hCI(6)
  hCI(8) = hCI(8) + hCI(7)

  filename = 'det_CIo.dat'
  open(newunit=nunit,file=filename,status='unknown')
    write(nunit,fmt2) '0   ', rhf
    write(nunit,fmt2) '1   ', hCI(2)
    write(nunit,fmt2) '1.5 ', hCI(3)
    write(nunit,fmt2) '2   ', hCI(4)
    write(nunit,fmt2) '2.5 ', hCI(5)
    write(nunit,fmt2) '3   ', hCI(6)
    write(nunit,fmt2) '3.5 ', hCI(7)
    write(nunit,fmt2) '4   ', hCI(8)
  close(nunit)

  filename = 'table.dat'
  open(newunit=nunit,file=filename,status='unknown')
    write(nunit,fmt1) rhf
    write(nunit,fmt1) hCI_bl(1,1), hCI_bl(1,2)
    write(nunit,fmt1) hCI_bl(2,1), hCI_bl(2,2), hCI_bl(2,3)
    write(nunit,fmt1) hCI_bl(3,1), hCI_bl(3,2), hCI_bl(3,3), hCI_bl(3,4)
    write(nunit,fmt1) hCI_bl(4,1), hCI_bl(4,2), hCI_bl(4,3), hCI_bl(4,4), hCI_bl(4,5)
    write(nunit,fmt1) hCI_bl(5,1), hCI_bl(5,2), hCI_bl(5,3), hCI_bl(5,4)
    write(nunit,fmt1) hCI_bl(6,1), hCI_bl(6,2), hCI_bl(6,3)
    write(nunit,fmt1) hCI_bl(7,1), hCI_bl(7,2)
    write(nunit,fmt1) hCI_bl(8,1)
  close(nunit)

end subroutine det_hCI
!-------------------------------------

!-------------------------------------
subroutine det_hCI_closed
  implicit none
  integer*16 :: tmp1, tmp2, tmp3, tmp4
  integer*16 :: i, j, p, q, r, s

  do i=1,8
    do p=0,i

      call binomial_coefficient(v,p,tmp3)
      call binomial_coefficient(o,p,tmp4)
      tmp1 = tmp3 * tmp4

      do r=0,i-p

        call binomial_coefficient(p,r,tmp3)
        call binomial_coefficient(v-p,i-p-r,tmp4)
        tmp2 = tmp3 * tmp4

        do q=0,i-p

          call binomial_coefficient(p,q,tmp3)
          call binomial_coefficient(o-p,i-p-q,tmp4)
          tmp3 = tmp3 * tmp4

          s = s0*(2*i-p) + 2*(i-q-r)
          j = s/2+1

          hCI_bl(i,j) = hCI_bl(i,j) + tmp1 * tmp2 * tmp3

        end do
      end do

    end do
  end do

end subroutine det_hCI_closed
!-------------------------------------

!-------------------------------------
subroutine det_hCI_open
  implicit none
  integer*16 :: tmp1, tmp2, tmp3, tmp4, tmp5
  integer*16 :: i, j, p, q, r, s, t

  do i=1,8
    do p=0,i

      call binomial_coefficient(va,p,tmp1)

      do t=0,p

        call binomial_coefficient(na-nb,t,tmp3)
        call binomial_coefficient(nb,p-t,tmp4)
        tmp2 = tmp3 * tmp4

        do r=0,i-p

          call binomial_coefficient(na-nb+p-t,r,tmp3)
          call binomial_coefficient(vb-(p+na-nb-t),i-p-r,tmp4)
          tmp3 = tmp3 * tmp4

          do q=0,i-p

            call binomial_coefficient(p-t,q,tmp4)
            call binomial_coefficient(nb-p+t,i-p-q,tmp5)
            tmp4 = tmp4 * tmp5

            s = s0 + 2*(i-q-r-t)
            j = (s-s0)/2+1

            hCI_bl(i,j) = hCI_bl(i,j) + tmp1 * tmp2 * tmp3 * tmp4

          end do
        end do
      end do

    end do
  end do

end subroutine det_hCI_open
!-------------------------------------


!-------------------------------------
subroutine det_eCI
  implicit none

  eCI = 0

  if( closed_shell ) then
    call det_eCI_closed
  else
    call det_eCI_open
  end if

  eCI(1) = eCI(1) + rhf
  eCI(2) = eCI(2) + eCI(1)
  eCI(3) = eCI(3) + eCI(2)
  eCI(4) = eCI(4) + eCI(3)

  filename = 'det_CI.dat'
  open(newunit=nunit,file=filename,status='unknown')
    write(nunit,fmt2) '0   ', rhf
    write(nunit,fmt2) '1   ', eCI(1)
    write(nunit,fmt2) '2   ', eCI(2)
    write(nunit,fmt2) '3   ', eCI(3)
    write(nunit,fmt2) '4   ', eCI(4)
  close(nunit)

end subroutine det_eCI
!-------------------------------------

!-------------------------------------
subroutine det_eCI_closed
  implicit none
  integer*16 :: tmp1, tmp2, tmp3, tmp4
  integer*16 :: i, p

  eCI = 0

  do i=1,4
    do p=0,i
      call binomial_coefficient(v,p,tmp1)
      call binomial_coefficient(o,p,tmp2)
      call binomial_coefficient(v,i-p,tmp3)
      call binomial_coefficient(o,i-p,tmp4)
      eCI(i) = eCI(i) + tmp1 * tmp2 * tmp3 * tmp4
    end do
  end do

end subroutine det_eCI_closed
!-------------------------------------

!-------------------------------------
subroutine det_eCI_open
  implicit none
  integer*16 :: tmp1, tmp2, tmp3, tmp4
  integer*16 :: i, p

  eCI = 0

  do i=1,4
    do p=0,i
      call binomial_coefficient(va,p,tmp1)
      call binomial_coefficient(na,p,tmp2)
      call binomial_coefficient(vb,i-p,tmp3)
      call binomial_coefficient(nb,i-p,tmp4)
      eCI(i) = eCI(i) + tmp1 * tmp2 * tmp3 * tmp4
    end do
  end do

end subroutine det_eCI_open
!-------------------------------------


!-------------------------------------
subroutine det_fci
  implicit none
  integer*16 :: tmp1

!call binomial_coefficient(k,o,tmp1)

  call binomial_coefficient(k,na,tmp1)
  call binomial_coefficient(k,nb,fci)

  fci = tmp1 * fci

  filename = 'det_FCI.dat'
  open(newunit=nunit,file=filename,status='unknown')
    write(nunit,fmt2) '0   ', fci
  close(nunit)

end subroutine det_fci
!-------------------------------------


!-------------------------------------
subroutine print_all_det
  implicit none

  filename = 'det.dat'

  if( closed_shell ) then
    open(newunit=nunit,file=filename,status='unknown')
      write(nunit,fmt2) 'FCI    ', fci
      write(nunit,fmt2) 'RHF    ', rhf
      write(nunit,fmt2) 'CIS    ', eCI(1)
      write(nunit,fmt2) 'CISD   ', eCI(2)
      write(nunit,fmt2) 'CISDT  ', eCI(3)
      write(nunit,fmt2) 'CISDTQ ', eCI(4)
      write(nunit,fmt2) 'CIs0   ', sCI(1)
      write(nunit,fmt2) 'CIs2   ', sCI(2)
      write(nunit,fmt2) 'CIs4   ', sCI(3)
      write(nunit,fmt2) 'CIo1   ', hCI(2)
      write(nunit,fmt2) 'CIo1.5 ', hCI(3)
      write(nunit,fmt2) 'CIo2   ', hCI(4)
      write(nunit,fmt2) 'CIo2.5 ', hCI(5)
      write(nunit,fmt2) 'CIo3   ', hCI(6)
      write(nunit,fmt2) 'CIo3.5 ', hCI(7)
      write(nunit,fmt2) 'CIo4   ', hCI(8)
    close(nunit)
  else
    open(newunit=nunit,file=filename,status='unknown')
      write(nunit,fmt2) 'FCI    ', fci
      write(nunit,fmt2) 'RHF    ', rhf
      write(nunit,fmt2) 'CIS    ', eCI(1)
      write(nunit,fmt2) 'CISD   ', eCI(2)
      write(nunit,fmt2) 'CISDT  ', eCI(3)
      write(nunit,fmt2) 'CISDTQ ', eCI(4)
      write(nunit,fmt2) 'CIs1   ', sCI(1)
      write(nunit,fmt2) 'CIs3   ', sCI(2)
      write(nunit,fmt2) 'CIs5   ', sCI(3)
      write(nunit,fmt2) 'CIo1   ', hCI(2)
      write(nunit,fmt2) 'CIo1.5 ', hCI(3)
      write(nunit,fmt2) 'CIo2   ', hCI(4)
      write(nunit,fmt2) 'CIo2.5 ', hCI(5)
      write(nunit,fmt2) 'CIo3   ', hCI(6)
      write(nunit,fmt2) 'CIo3.5 ', hCI(7)
      write(nunit,fmt2) 'CIo4   ', hCI(8)
    close(nunit)
  end if
end subroutine print_all_det
!-------------------------------------


!-------------------------------------
subroutine binomial_coefficient(n,k,c)
! (n k) = n!/((n-k)!k!)
  implicit none
  integer*16, intent(in)  :: n, k
  integer*16, intent(out) :: c
  integer*16              :: i
  real*8                  :: cr

  if( n.lt.k .or. k.lt.0 ) then
    c = 0
    return
  end if

  cr = 1.0d0
  do i=1,min(k,n-k)
    cr = cr * real( n+1-i ) / real( i )
  end do
  c = int( cr )

end subroutine binomial_coefficient
!-------------------------------------

end program determinants
!-------------------------------------
