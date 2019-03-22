identification division.
program-id. prime1.

environment division.
input-output section.
file-control.
select INPUT-FILE assign to "primes.dat"
  organization is line sequential.

select OUTPUT-FILE assign to "output.dat"
  organization is line sequential.

data division.
file section.
fd INPUT-FILE.
01 input-record.
 05 num pic X(100).

fd OUTPUT-FILE.
01 OUT-LINE.
 05 info pic X(100).


WORKING-STORAGE SECTION.
77 N PICTURE S9(9).
77 R PICTURE S9(9) USAGE IS COMPUTATIONAL.
77 I PICTURE S9(9) USAGE IS COMPUTATIONAL.
01 IN-CARD.
02 IN-N PICTURE 9(9).
02 FILLER PICTURE X(71).
01 TITLE-LINE.
02 FILLER PICTURE X(6) VALUE SPACES.
02 FILLER PICTURE X(20) VALUE 'PRIME NUMBER RESULTS'.
01 UNDER-LINE.
02 FILLER PICTURE X(32) VALUE
' -------------------------------'.
01 NOT-A-PRIME-LINE.
02 FILLER PICTURE X VALUE SPACE.
02 OUT-N-2 PICTURE Z(8)9.
02 FILLER PICTURE X(15) VALUE ' IS NOT A PRIME'.
01 PRIME-LINE.
02 FILLER PICTURE X VALUE SPACE.
02 OUT-N-3 PICTURE Z(8)9.
02 FILLER PICTURE X(11) VALUE ' IS A PRIME'.
01 ERROR-MESS.
02 FILLER PICTURE X VALUE SPACE.
02 OUT-N PICTURE Z(8)9.
02 FILLER PICTURE X(14) VALUE ' ILLEGAL INPUT'.

77 INPUT-VAR PICTURE 9(09) VALUE 1.

01 LOOP-BOOL PICTURE X(1) Value 'N'.
  88 TRUE-BOOL value 'Y'.
  88 FALSE-BOOL Value 'N'.




  PROCEDURE DIVISION.
  OPEN INPUT INPUT-FILE, OUTPUT OUTPUT-FILE.
  WRITE OUT-LINE FROM TITLE-LINE AFTER ADVANCING 0 LINES.
  WRITE OUT-LINE FROM UNDER-LINE AFTER ADVANCING 1 LINE.

  *> itterate through file until end, then set indicator to true to end statement
  PERFORM UNTIL INPUT-VAR EQUAL 0

    display 'FIND OUT IF NUMBER IS PRIME (ENTER 0 to exit)'
    ACCEPT INPUT-VAR FROM CONSOLE
    END-ACCEPT

    display 'input:' INPUT-var

    MOVE INPUT-var TO N
    move 0 to i

    IF N IS GREATER THAN 1

      IF N IS LESS THAN 4
        display input-var ' is prime'
      ELSE
        MOVE 2 TO R

        *>loop through until two possible endings occur
        PERFORM UNTIL TRUE-BOOL

          DIVIDE R INTO N GIVING I
          MULTIPLY R BY I

          IF I IS NOT EQUAL TO N
            ADD 1 TO R
            IF R IS LESS THAN N *> cant be N is greater than or equal to R to remove continue for some reason
              continue
            ELSE
              MOVE 'Y' to LOOP-BOOL
              display input-VAR ' is a prime number'
            END-IF
          ELSE
            MOVE 'Y' to LOOP-BOOL
            display input-VAR ' is NOT a prime number'
          END-IF
        END-PERFORM
        *>reset loop boolean
        MOVE 'N' to LOOP-BOOL
        END-IF
    ELSE
        display 'PROGRAM EXITING'
    END-IF
  END-PERFORM.


  CLOSE INPUT-FILE, OUTPUT-FILE.
  STOP RUN.
