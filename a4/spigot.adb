--By:Clayton Provan
--  Legacy Assignement 4
--  march 27th, 2018
--  program to calculate digits of Pi

with ada.Text_IO; use Ada.Text_IO;
with Ada.Sequential_IO;
with Ada.Integer_Text_IO;           use Ada.Integer_Text_IO;

procedure spigot is
    n:constant := 1000;
    nines,predigit,q,x,len : integer;
    type newArray is array(Integer range <>) of Float;
    OUTPUT : File_Type;
     filename: String(1 .. 10) := (others => ' ');
    Last: Integer;

begin
  len := ((n*10)/3) +1;

  put("Enter Filename:");
  Get_Line(filename, Last);
  Create(OUTPUT, Out_File, filename);

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
        --get mod of x and i for digits
        for i in reverse 1..len loop
          x := Integer(10.0*a(i-1)) + q*i;
          a(i-1) := Float(x mod (2*i -1));
          q := x/(2*i -1);
        end loop;

        a(0) := Float( q mod 10);
        q:=q/10;

        --decide what digits to print to file
        if q = 9 then
          nines := nines + 1;
        elsif q = 10 then

          Put(OUTPUT,predigit+1, Width => 0);
          for k in 0..nines-1 loop
            put(OUTPUT,'0');
          end loop;
          predigit := 0;
          nines := 0;
        else

          Put(OUTPUT,predigit, Width => 0);
          predigit := q;
          if nines /= 0 then
            for k in 0..nines-1 loop
              put(OUTPUT,'9');
            end loop;
            nines := 0;
          end if;
        end if;

     end loop;
   end;
--put last digit to file and a newline
  Put(OUTPUT,predigit, Width => 0);
  put_line(OUTPUT,"");

  Close (Output);
end spigot;
