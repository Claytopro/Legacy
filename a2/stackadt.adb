-- STACK PACKAGE
-- CIS 3190 - Assignement 2
-- by: Clayton Provan

-- program is a package to use the stack data structure

with ada.Text_IO; use Ada.Text_IO;
package body stackADT is
  type list is array(1..10000000) of integer;
  type int_stack is
      record
        item : list;
        top : natural := 0;
      end record;
--deals with m and n value stacks of ackermann function
  sNvalue : int_stack;
  sMvalue : int_stack;
-- deals with switch statement of ackerman function
  sGoto : int_stack;

--ads value to list and increaments top of stack counter for all three stacks
  procedure push(x : in integer; y: in integer; z : in integer) is
  begin
    if sMvalue.top = 10000000 then
      put_line("stack is full");
    else
      sMvalue.top := sMvalue.top +1;
      sMvalue.item(sMvalue.top) := x;

      sNvalue.top := sNvalue.top +1;
      sNvalue.item(sNvalue.top) := y;

      sGoto.top := sGoto.top +1;
      sGoto.item(sGoto.top) := z;
    end if;
  end push;

--gets value at top of stack then decrements count of stack point
  procedure pop( x : out integer;y : out integer; z : out integer) is
  begin
    if sMvalue.top = 0 then
      put_line("stack is full");
    else
      x := sMvalue.item(sMvalue.top);
      sMvalue.top := sMvalue.top - 1;

      y := sNvalue.item(sNvalue.top);
      sNvalue.top := sNvalue.top - 1;

      z := sGoto.item(sGoto.top);
      sGoto.top := sGoto.top - 1;
    end if;
  end pop;

--checks if stack is empty by checking if top is pointing to zero element
  function isEmpty return Boolean is
  begin
    return sMvalue.top = 0;
  end isEmpty;

--sets stack pointer to zero so any new pushes will overwrite old stored data
  procedure clear is
  begin
    sMvalue.top := 0;
    sNvalue.top :=0;
  end clear;


end stackADT;
