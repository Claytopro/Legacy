-- spigot calculating digits of pi
-- CIS 3190 - Assignement 4
-- by: Clayton Provan


with ada.Text_IO; use Ada.Text_IO;

with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure spigot is
    n:constant := 1000;
    nines,predigit,i,j,k,q,x,len : integer;
    type newArray is array(Integer range <>) of Float;

begin
  len := ((n*10)/3) +1;

  declare
     a : newArray(0..len);
   begin
     for j in 0..len loop
       a(j) :=2.0;
     end loop;
     nines := 0;
     predigit :=0;

   --ada loops are inclusive so j will = n at end
     for j in 1..n loop
        q :=0;

        for i in reverse 1..len loop
          x := Integer(10.0*a(i-1)) + q*i;
          a(i-1) := Float(x mod (2*i -1));
          q := x/(2*i -1);
        end loop;

        a(0) := Float( q mod 10);
        q:=q/10;

        if q = 9 then
          nines++;
        elsif q = 10 then

        else

        end if;

     end loop;

   end;

end spigot;
