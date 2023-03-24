import 'package:a/Car.dart';
import 'package:a/SearchCar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  TextEditingController cnm=new TextEditingController();
  TextEditingController cColor=new TextEditingController();
  double price=200000;
  List<Car> carLis=[];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("car")),
      body: Column(
        children: [
          SizedBox(height: 30,),
          TextField(controller: widget.cnm,decoration: InputDecoration(labelText: "enter the car name")),
          SizedBox(height: 10,),
          TextField(controller: widget.cColor,decoration: InputDecoration(labelText: "enter the car color")),
          SizedBox(height: 10,),
          Slider(min:200000,max: 1500000,value: widget.price, onChanged: (value) {
            widget.price=value;
            setState(() {

            });
          },),
          SizedBox(height: 10,),
          Text(widget.price.toInt().toString()),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            Car newCar=new Car();
            newCar.carName=widget.cnm.text;
            newCar.carColor=widget.cColor.text;
            newCar.carPrice=widget.price.toInt();
            widget.carLis.add(newCar);
            print(widget.carLis);
          }, child: Text("save")),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  Search(widget.carLis);
        },));
      },child: Icon(Icons.search),),
    );
  }
}


