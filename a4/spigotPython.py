#!/usr/bin/python
import sys

n = 1000
len = ((n*10)/3) +1
a=[0]*(len+1)

for j in range(0,len):
    a[j] = 2


nines =0
predigit =0

for j in range(0,n+1):
    q = 0

    for i in range(len,0,-1):

        x = 10 * a[i-1] + q*i
        a[i-1] = x %(2*i -1)
        q = x / (2*i -1)

    a[0] = q % 10
    q = q/10

    if q == 9:
        nines += 1
    elif q == 10:
        sys.stdout.write(str(predigit+1))

        for k in range(0,nines):
            sys.stdout.write('0')

        predigit = 0
        nines = 0
    else:
        sys.stdout.write(str(predigit))
        predigit = q
        if nines != 0:
            for k in range(0,nines):
                sys.stdout.write('9')
            nines = 0

print predigit
