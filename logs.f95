program log
!
! This program reads a real number r and prints
! the area of a circle with radius r.
!
implicit none
real DS,DL,TL,KERF,V, Vcubic
integer newLogBool
call getLOGdata(DS,DL,TL,KERF)
!write(*,*) 'ds is', DS, 'DL is ',DL,' TL is ', TL,'KERF IS ', KERF
do while(newLogBool /= 1)

call calcLOGjclark(DS,DL,TL,KERF,V)
write(*,*) 'Volume is:',V

call calcLOGvolume(DS,DL,TL,Vcubic)
write (*,*) 'The board feet measured in cubic meters is:',Vcubic

write(*,*) 'If you would like to enter new information to be calculated please enter (1), if not enter anything else'
READ *, newLogBool
end do

end PROGRAM

!gets lod data from user in imperial measurements
SUBROUTINE getLOGdata(DS,DL,TL,KERF)
implicit none
REAL DS,DL,TL,KERF

do
  write (*,*) 'ENTER THE LOGS SCALLING DIAMETER'
  READ *,DS
  if(DS >= 0) exit
  write(*,*) 'PLEASE ENTER POSITIVE NUMBER'
end do

do
write (*,*) 'ENTER THE DIB AT LOG’S LARGE END (INCHES) (0.0 IF 1/2 INCH TAPER)'
READ *,DL
if(DL >= 0) exit
write(*,*) 'PLEASE ENTER POSITIVE NUMBER'
end do

do
write (*,*) 'ENTER THE TOTAL LOG LENGTH (FEET)'
READ *,TL
if(TL >= 0) exit
write(*,*) 'PLEASE ENTER POSITIVE NUMBER'
end do

do
write (*,*) 'ENTER THE LOG KERF IN INCHES IN DECIMAL'
READ *,KERF
if(KERF >= 0) exit
write(*,*) 'PLEASE ENTER POSITIVE NUMBER'
end do

RETURN
END

SUBROUTINE calcLOGjclark(DS,DL,TL,KERF,V)
implicit none
REAL DS,DL,TL,KERF,V
!implitcit variables used in legacy routine
REAl T,SL,D,DC, XI,XL,DEX,VADD
integer :: i,L
v = 0.0
!if the total log length is
if(TL<4.0) then
  RETURN
end if

if(DL == 0.0)  then
  T = 0.5
else
  T=4.0*(DL-DS)/TL
end if

!find the number of 4 foot segements the log contains, maximum 20 based on legacy routine
do i = 1, 20
 if(TL - FLOAT(4*i) < 0) exit
end do
L = i-1
SL = FLOAT(4*L)


D=DS+(T/4.0)*(TL-SL)

do i = 1, 20
 XI=FLOAT(I)
 IF(SL-TL+XI > 0) exit
end do


!calculate log volume at the small end of long in the 1,2,3 foot sedement
XL=XI-1.0
DEX=DS+(T/4.0)*(TL-SL-XL)
VADD=0.055*XL*DEX*DEX-0.1775*XL*DEX

do i=1,L
  DC=D+T*FLOAT(I-1)
  V=V+0.22*DC*DC-0.71*DC
end do
V=V+VADD

!if kerf is creater than
if(KERF > 0.25)  then
  V=0.905*V
end if

RETURN
END

!conver board feet to cubic meters
! 1 cubic meter = 423.776 board feet
SUBROUTINE calcLOGvolume(DS,DL,TL, Vcubic)
implicit none
 real, parameter :: pi = 3.14159
real DS,DL,TL,Vcubic
real MDS,MDL,MTL,A1,A2
integer dlFactor

if(DL == 0) then
  dlFactor = Floor(DS/4)
  DL = DS + (FLOAT(dlFactor)*(0.5))
end if

MDS = ((DS/39.37)/2)
MDL = ((DL/39.37)/2)
MTL = TL/3.2808

!GET AREA OF SMALL END AND LARGE END OF LOG
A1 = pi*MDS*MDS
A2 = pi*MDL*MDL

Vcubic = ((A1+A2)/2)*MTL

END
