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

procedure division.
open input input-file, output output-file.
write out-line from title-line after advancing 0 lines.
write out-line from under-line after advancing 1 line.
1. read input-file into in-card at end go to finish.
move in-n to n.
display n.
if n is greater than 1 go to b1.
move in-n to out-n.
write out-line from error-mess after advancing 1 line.
go to 1.
b1. if n is less than 4 go to 3.
move 2 to r.
2.divide r into n giving i.
multiply r by i.
if i is not equal to n go to b2.
move in-n to out-n-2.
write out-line from not-a-prime-line after advancing 1 line.
go to 1.
b2. add 1 to r.
if r is less than n go to 2.
3. move in-n to out-n-3.
write out-line from prime-line after advancing 1 line.
go to 1.
finish.
display 'results output to output.dat'

close input-file, output-file.
stop run.
