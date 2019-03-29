
program spigot

!this program calculates 1000 digits of Pi

integer,parameter :: n = 1000
integer,parameter :: len =3334
real :: a(3334)

integer :: nines,predigit,i,j,k,q,x

do j = 1,len
  a(j) = 2;
end do

nines = 0
predigit = 0

do j = 1 , n

  q = 0

  do i = len, 1,-1
    x = INT(10*a(i-1)) + q*i
    a(i-1) = real(MOD(x,(2*i -1)))
    q = x / (2*i -1)
  end do

  a(1) = MOD(q,10)
  q = q/10

  if ( q == 9 ) then
    nines = nines + 1
  else if ( q == 10) then
  write(6,fmt='(i1)',advance='no') predigit+1
    do k = 0,nines-1
    write(6,fmt='(i1)',advance='no') 0
    end do
    predigit = 0
    nines = 0
  else
      write(6,fmt='(i1)',advance='no') predigit
      predigit = q
      if(nines /= 0) then
        do k = 0,nines-1
            write(*,*) '9'
        end do
        nines = 0
      end if
  end if
end do

write(6,fmt='(i1)',advance='yes') predigit

end program spigot
