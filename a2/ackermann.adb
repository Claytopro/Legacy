-- NONRECURSIVE ACKERMANN
-- CIS 3190 - Assignement 2
-- by: Clayton Provan

-- Program takes user input from command line and calulates the ackermann value
-- no letters can be accepted and only 2 arguments are allowed to be subimmited



with ada.Text_IO; use Ada.Text_IO;
with stackadt; use stackadt;
with Ada.Command_line; use Ada.Command_Line;
with Numeric_Tests; use Numeric_Tests;
with Ada.Calendar; use Ada.Calendar;

procedure ackermann is
  --clearly used to determine if input is valid
    validEntry : Boolean;
  -- values taken from Command line and used to calculate ackermann function
  -- ACKERMANN(M,N)
    n : integer;
    m : integer;
  -- used to hold value of where to go to at top of calculating loop
    gotoInt : integer;
  --holds final value
    ack :integer;
  --used to test run time of program
    startTime, endTime : Time;
    timeElapsed : Duration;
begin
  validEntry := true;
  --following 3 conditional statements tests for correct number of arguments as well as if they are numeric
  if Argument_Count /= 2 then
    put_line("Invalid number of arguments");
    validEntry := false;
  end if;

  if Is_Numeric(Argument(1)) = false then
    put_line("invalid first parameter, must be integer");
    validEntry := false;
  else
  m := Integer'Value(Argument(1));
  end if;

  if Is_Numeric(Argument(2)) = false then
    put_line("invalid second parameter, must be integer");
    validEntry := false;
  else
  n := Integer'Value(Argument(2));
  end if;

  --runs ackermann function non recursively if entry was valid
  if validEntry then
  clear;
  ack := 0;
  gotoInt := 1;
  startTime := Clock;

  push(m,n,gotoInt);
  --goes through steps as long as the stack is not empty
  while isEmpty = false loop
    pop(m,n,gotoInt);
  --gotoInt values of 4 and 2 are not processed and can be considered like "continue"

  -- as long as m doesnt equal zero we check if n is equal to zero
  -- then push values onto stack and change values of m and n based on
  -- non recursive ackermann algorithm
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
    -- if we take 3 off the stack then do the following code and repeat
    -- procedure of gotoInt equalling 1
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
  
  endTime := Clock;
  timeElapsed := (endTime - startTime) *1000;

  put_line("result is " & Integer'Image(ack));
  put_line("Run time = " & Duration'Image(timeElapsed) & " milliseconds");
else
  put_line("try again and enter valid input please");
end if;

end ackermann;
