import 'package:flutter/material.dart';

import 'Student.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}
class Student{
  String studentName="";
  String studentEn="";
  int studentMark1=0;
  int studentMark2=0;
  int studentMark3=0;
}
class MyApp extends StatefulWidget {
  TextEditingController snm=new TextEditingController();
  TextEditingController sen=new TextEditingController();
  // TextEditingController smark1=new TextEditingController();
  // TextEditingController smark2=new TextEditingController();
  // TextEditingController smark3=new TextEditingController();
  double sm1=0;
  double sm2=0;
  double sm3=0;
  List<Student> studentLis=[];

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
          TextField(controller: widget.snm,decoration: InputDecoration(labelText: "enter the student name")),
          SizedBox(height: 10,),
          TextField(controller: widget.sen,decoration: InputDecoration(labelText: "enter the student en. no")),
          SizedBox(height: 10,),
          Slider(min:0,max: 100,value: widget.sm1, onChanged: (value) {
            widget.sm1=value;
            setState(() {

            });
          },
          label: "mark1",),
          SizedBox(height: 10,),
          Slider(min:0,max: 100,value: widget.sm2, onChanged: (value) {
            widget.sm2=value;
            setState(() {

            });
          },
              label: "mark2"),
          SizedBox(height: 10,),
          Slider(min:0,max: 100,value: widget.sm3, onChanged: (value) {
            widget.sm3=value;
            setState(() {

            });
          },
              label: "mark3"),
          SizedBox(height: 10,),
          Text(widget.sm1.toInt().toString()),
          SizedBox(height: 10,),
          Text(widget.sm2.toInt().toString()),
          SizedBox(height: 10,),
          Text(widget.sm3.toInt().toString()),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            Student newStudent=new Student();
            newStudent.studentName=widget.snm.text;
            newStudent.studentEn=widget.sen.text;
            newStudent.studentMark1=widget.sm1.toInt();
            newStudent.studentMark2=widget.sm2.toInt();
            newStudent.studentMark3=widget.sm3.toInt();
            widget.studentLis.add(newStudent);
            print(widget.studentLis);
          }, child: Text("save")),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  View(widget.studentLis);
        },));
      },child: Text("view")),
    );
  }
}

class View extends StatefulWidget {
  // List<Student> studentLis;
  List<Student> stuLis=[];
  View(this.stuLis);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  // void refresh(){
  //   setState(() {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Students")),
      body: ListView.builder(itemCount: widget.stuLis.length,itemBuilder: (context, index) {
        return Card(child: ListTile(
          leading: Icon(Icons.account_circle),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return  Specific(widget.stuLis[index],widget.stuLis);
            },)
                // .then((value) => refresh()
            );
          },
          title: Text(widget.stuLis[index].studentEn),
        ),);
      },),
    );
  }
}

class Specific extends StatefulWidget {

  // List<Student> stuLis;

  List<Student> sLis=[];
  Student stu;
  // String stuEn="";
  Specific(this.stu,this.sLis);

  @override
  State<Specific> createState() => _SpecificState();
}

class _SpecificState extends State<Specific> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student"),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(child: Text("Student Details",style: TextStyle(fontSize: 20.00),)),
            SizedBox(height: 10,),
            Text("Name:"+widget.stu.studentName),
            SizedBox(height: 10,),
            Text("En:"+widget.stu.studentEn),
            SizedBox(height: 10,),
            Text("mark1:"+widget.stu.studentMark1.toString()),
            SizedBox(height: 10,),
            Text("mark2:"+widget.stu.studentMark2.toString()),
            SizedBox(height: 10,),
            Text("mark3:"+widget.stu.studentMark3.toString()),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              widget.sLis.remove(widget.stu);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return  View(widget.sLis);
              },));
            }, child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}


