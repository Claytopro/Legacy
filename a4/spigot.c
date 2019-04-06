/*
By:Clayton Provan
  Legacy Assignement 4
  march 27th, 2018
  program to calculate digits of Pi
*/



#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int n = 1000;

int main(){
  int nines,predigit,i,j,k,q,x;
  int len = ((n*10)/3) +1;
  double *a = malloc(sizeof(double)*(len+1));
  char *searchStr  = malloc(sizeof(char)*1000);
  FILE *fp;

  printf("Enter file name:");
  fgets(searchStr, sizeof(char)*1001, stdin);
  searchStr[strcspn(searchStr, "\n")] = 0;

  fp = fopen(searchStr,"w+");
  //fill up array with 2

  for(j=0;j<len;j++){
    a[j] =2;
  }

  nines =0;
  predigit =0;

  for(j=1;j<=n;j++){

    q=0;

    for(i=len;i>=1;i--){
      x= 10*a[i-1] + q*i;
      a[i-1] = x %(2*i -1);
      q = x / (2*i -1);
    }

    a[0] = q%10;
    q = q/10;


    if(q==9){
      nines++;
    }
    else if(q ==10){
  //    printf("%d", predigit+1);
      fprintf(fp, "%d",predigit +1 );

      for(k=0;k<nines;k++){
        fprintf(fp, "0");
      }
      predigit = 0;
      nines =0;

    }else{
      fprintf(fp, "%d",predigit);
      predigit = q;
      if(nines !=0){
        for(k=0;k<nines;k++){
          fprintf(fp, "9");
        }
        nines =0;
      }
    }
  }
  fprintf(fp, "%d",predigit);

  free(searchStr);
  return 1;
}
