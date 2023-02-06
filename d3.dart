//prime number
void main ()
{ 
  int number=1;
  while(number<=100){
    int count=0;
    for(int a=1;a<=number;a++)
    {
      if(number%a==0)
      {
        count++;
      }
    }
    if(count==2)
    {
      print("prime num: $number");
    }
    // else
    // {
    //   print("Not prime num: $number");
    // }
    number++;
  }
}