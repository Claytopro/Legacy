-- NONRECURSIVE ACKERMANN
-- CIS 3190 - Assignement 2
-- by: Clayton Provan

-- Program takes user input and calulates the ackermann value

--program gets user input


with ada.Text_IO; use Ada.Text_IO;
with stackadt; use stackadt;
with Ada.Command_line; use Ada.Command_Line;
with Numeric_Tests; use Numeric_Tests;

procedure ackermann is
-- define variables here
    validEntry : Boolean;
    n : integer;
    m : integer;
    gotoInt : integer;
    ack :integer;
begin
  validEntry := true;
  -- tests for correct number of arguments as well as if they are numeric
  if Argument_Count /= 2 then
    put_line("Invalid number of arguments");
    validEntry := false;
  end if;

  if Is_Numeric(Argument(1)) = false then
    put_line("invalid first parameter, must be numeric");
    validEntry := false;
  else
  m := Integer'Value(Argument(1));
  end if;

  if Is_Numeric(Argument(2)) = false then
    put_line("invalid second parameter, must be numeric");
    validEntry := false;
  else
  n := Integer'Value(Argument(2));
  end if;

  --runs ackermann function non recursively if entry was valid
  if validEntry then
  clear;
  ack := 0;
  gotoInt := 1;
  push(m,n,gotoInt);

  while isEmpty = false loop
    pop(m,n,gotoInt);
    put_line(" m n goto" & Integer'Image(m) &Integer'Image(n) & Integer'Image(gotoInt) );
    if gotoInt = 1 then
        while m /= 0 loop
          if n = 0 then
            push(m,n,2);
            m := m-1;
            n := 1;
          else
            push(m,n,3);
            n:=n-1;
          end if;
        end loop;
        ack := n +1;

      elsif gotoInt = 3 then
        push(m,n,4);
        m := m-1;
        n :=Ack;
        while m /= 0 loop
          if n = 0 then
            push(m,n,2);
            m := m-1;
            n := 1;
          else
            push(m,n,3);
            n:=n-1;
          end if;
        end loop;
        ack := n +1;

    end if;
  end loop;
  put_line("result is " & Integer'Image(ack));
else
  put_line("try again and enter valid input please");
end if;

end ackermann;
