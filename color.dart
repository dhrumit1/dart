import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: clr_slider(),
  ));
}

class clr_slider extends StatefulWidget {
  const clr_slider({Key? key}) : super(key: key);

  @override
  State<clr_slider> createState() => _clr_sliderState();
}

class _clr_sliderState extends State<clr_slider> {
  double clrRed = 0.0;
  double clrGreen = 0.0;
  double clrBlue = 0.0;
  Color clr = Colors.white;
  List<int> lis=[];
  TextEditingController mark=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Slider Color Change Demo")),
      ),
      backgroundColor: clr,
      body: Column(
        children: [
          Slider(
            min: 0,
            max: 255,
            activeColor: Colors.red,
            onChanged: (value) {
              clrRed = value;
              clr = Color.fromRGBO(clrRed.toInt(), clrGreen.toInt(), clrBlue.toInt(), 1);
              setState(() {});
            },
            value: clrRed,
          ),
          Slider(
            min: 0,
            max: 255,
            activeColor: Colors.green,
            onChanged: (value) {
              clrGreen = value;
              clr = Color.fromRGBO(clrRed.toInt(), clrGreen.toInt(), clrBlue.toInt(), 1);
              setState(() {});
            },
            value: clrGreen,
          ),
          Slider(
            min: 0,
            max: 255,
            activeColor: Colors.blue,
            onChanged: (value) {
              clrBlue = value;
              clr = Color.fromRGBO(clrRed.toInt(), clrGreen.toInt(), clrBlue.toInt(), 1);
              setState(() {});
            },
            value: clrBlue,
          ),
          SizedBox(height: 30,),
          TextField(controller: mark,decoration: InputDecoration(labelText: "enter the marks"),),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            lis.add(int.parse(mark.text));
            print(lis);
          }, child: Text("Add",)),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SecondPage("Abcd",lis,clr);
        },));
      }, child: Icon(Icons.navigate_next_outlined),),
    );
  }
}

class SecondPage extends StatefulWidget {
  String str="";
  List lis1=[];
  Color c=Colors.white;
  SecondPage(this.str,this.lis1,this.c);
  int index=0;


  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.c,
      appBar: AppBar(title: Text(widget.str),),
      body: Column(children: [
        SizedBox(height: 30),
        Text(widget.lis1[widget.index].toString()),
        SizedBox(height: 20),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {
                widget.index=0;
                setState(() {

                });
              }, child: Text("<<")),
              ElevatedButton(onPressed: () {
                if(widget.index>0){
                  widget.index--;
                }
                else{
                  widget.index=0;
                }
                setState(() {

                });
              }, child: Text("<")),
              ElevatedButton(onPressed: () {
                if(widget.index<widget.lis1.length-1){
                  widget.index++;
                }
                else{
                  widget.index=widget.lis1.length-1;
                }
                setState(() {

                });
              }, child: Text(">")),
              ElevatedButton(onPressed: () {
                widget.index=widget.lis1.length-1;
                setState(() {

                });
              }, child: Text(">>")),
            ]),
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ThirdPage(widget.lis1);
        },));
      },child: Icon(Icons.next_plan)),
    );
  }
}

class ThirdPage extends StatefulWidget {
  List lis2=[];
  ThirdPage(this.lis2);


  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("cgvfd"),),
      body: Text(widget.lis2[0].toString()),
    );
  }
}
