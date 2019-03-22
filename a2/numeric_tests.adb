--Source :https://rosettacode.org/wiki/Determine_if_a_string_is_numeric#Ada
--Packaged used to validate if string in a digit or not

package body Numeric_Tests is
   function Is_Numeric (Item : in String) return Boolean is
      Dummy : integer;
   begin
      Dummy := Integer'Value (Item);
      return True;
   exception
      when others =>
         return False;
   end Is_Numeric;
end Numeric_Tests;
