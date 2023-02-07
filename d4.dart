// armstromge number
void main(){
  int number=1;
  while(number<=999)
  { 
    if(number<=9)
    {
      int sum=0;
      sum=sum+(number*1);
      if (number==sum)
      {
        print("$number is armstrong");
      }
    }

    if(number>=10 && number<=99) // In 10 to 99 not any armstrong number 
    {
      String  str=number.toString();
      var lis=str.split("");

      int sqr1=int.parse(lis[0])*int.parse(lis[0]);
      int sqr2=int.parse(lis[1])*int.parse(lis[1]);

      int sum=sqr1+sqr2;

      if(number==sum)
      {
        print("$number is armstrong");
      }
    }

    if(number>=100 && number<=999)
    {
      String  str=number.toString();
      var lis=str.split("");

      int cube1=int.parse(lis[0])*int.parse(lis[0])*int.parse(lis[0]);
      int cube2=int.parse(lis[1])*int.parse(lis[1])*int.parse(lis[1]);
      int cube3=int.parse(lis[2])*int.parse(lis[2])*int.parse(lis[2]);

      int sum=cube1+cube2+cube3;

      if(number==sum)
      {
        print("$number is armstrong");
      }
    }
    number++;
  }

}