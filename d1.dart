// Datatype and variable
import 'dart:io';

void main(){
  int a; // a is not null must give value
  // print(a);

  int? b; // ? men`s it can be null
  print(b);

  int c=5;
  print(c);

  // int d=12345678998745632175342; // int datatype is not store lage number

  BigInt longValue;
  longValue=BigInt.parse("12345678998745632175342"); // parse convert string value to integer value
  print(longValue);
  
  double d=10.00;
  num e=20.00;
  print(d+e);
  print("$d "+" $e");

  bool isLogin=false;

  String name="dhrumit";
  print(name);
}

