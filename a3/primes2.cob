identification division.
program-id. prime1.

environment division.
input-output section.
file-control.
select input-file assign to "primes.dat"
  organization is line sequential.

select output-file assign to "output.dat"
  organization is line sequential.

data division.
file section.
fd input-file.
01 input-record.
 05 num pic x(100).

fd output-file.
01 out-line.
 05 info pic x(100).


working-storage section.
*>variables used for computing if number is prime
77 n picture s9(9).
77 r picture s9(9) usage is computational.
77 i picture s9(9) usage is computational.

01 in-card.
02 in-n picture 9(9).
02 filler picture x(71).
01 title-line.
02 filler picture x(6) value spaces.
02 filler picture x(20) value 'prime number results'.
01 under-line.
02 filler picture x(32) value
' -------------------------------'.
01 not-a-prime-line.
02 filler picture x value space.
02 out-n-2 picture z(8)9.
02 filler picture x(15) value ' is not a prime'.
01 prime-line.
02 filler picture x value space.
02 out-n-3 picture z(8)9.
02 filler picture x(11) value ' is a prime'.
01 error-mess.
02 filler picture x value space.
02 out-n picture z(8)9.
02 filler picture x(14) value ' illegal input'.
*>used to check when end of file has been reached
01 eof picture x(01) value 'n'.
  88 eof-bool value 'y'.
  88 not-eof-bool value 'n'.
*>used to determine when inner loop
01 loop-bool picture x(1) value 'n'.
  88 true-bool value 'y'.
  88 false-bool value 'n'.


procedure division.
open input input-file, output output-file.
write out-line from title-line after advancing 0 lines.
write out-line from under-line after advancing 1 line.

*> itterate through file until end, then set indicator to true to end statement
perform until eof-bool
read input-file into in-card
  at end move 'y' to eof
not at end
  *>read in number
  move in-n to n
  display n
  move 0 to i

  if n > 1
    if n < 4
      move in-n to out-n-3
      write out-line from prime-line after advancing 1 line
    else
      move 2 to r

      *>loop through until two possible endings occur
      perform until true-bool

        compute i = n/r
        compute i = r*i

        if i not = n
          *> wont compile with compute r =r +1
          add 1 to r
          display 'this wont compile'

          *>if r us greater than or equal to n then we know n is not a prime and we can add to file
          if not r < n
            move 'y' to loop-bool
            move in-n to out-n-3
            write out-line from prime-line after advancing 1 line
          end-if
        else
          *>if we get to a value where i i equal to n then we know it is prime and can write it to file and end loop
            move 'y' to loop-bool
          move in-n to out-n-2
          write out-line from not-a-prime-line after advancing 1 line
        end-if
      end-perform
      *>reset loop boolean
      move 'n' to loop-bool
      end-if
  else
    move in-n to out-n
    write out-line from error-mess after advancing 1 line
  end-if

end-perform.

display 'results output to output.dat'

close input-file, output-file.
stop run.
