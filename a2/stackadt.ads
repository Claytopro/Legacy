-- STACK PACKAGE
-- CIS 3190 - Assignement 2
-- by: Clayton Provan

-- program is a package to use the stack data structure

package stackADT is
  --package variables
  procedure push( x : in integer;y : in integer; z : in integer);
  procedure pop( x : out integer;y : out integer;z : out integer);
  function isEmpty return Boolean;
  procedure clear;

end stackADT;
