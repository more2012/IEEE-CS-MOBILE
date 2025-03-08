import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());


}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Task 8",style: TextStyle(color: Colors.white),), backgroundColor: Colors.black,),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color:  const Color(0xffe6f0fa),
                      border: Border.all(color: Colors.black, width: 2)
                  ),
                  padding: const EdgeInsets.all(20),
                  width: 450,
                  child: Text("Mohamed Wael Mahdi", textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black)),),
                Container(
                  decoration: BoxDecoration(
                      color:  const Color(0xffe6f0fa),
                      border: Border.all(color: Colors.black, width: 2)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  width: 450,
                  height: 100,
                  child: Text(
                      "Life is like riding a bicycle. To keep your balance, you must keep moving.	",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black)),),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color:  const Color(0xffe6f0fa),
                      border: Border.all(color: Colors.black, width: 2)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  width: 1000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // المسافة بينهم ضعف المسافة من الاول والاخر
                    children: [const
                    Row(children: [
                      Icon(Icons.star, size: 20, color: Colors.amber,),
                      Icon(Icons.star, size: 20, color: Colors.amber),
                      Icon(Icons.star, size: 20, color: Colors.amber),
                      Icon(Icons.star, size: 20, color: Colors.amber),
                      Icon(Icons.star, size: 20, color: Colors.amber),
                      Icon(Icons.star, size: 20, color: Colors.amber)
                    ],
                    ),
                      Text("0 Reviews")
                    ],
                  ),

                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color:  const Color(0xffe6f0fa),
                     border: Border.all(color: Colors.black, width: 2)
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      Column(children: [
                        Icon(Icons.accessibility_new_rounded,color: Colors.green[400],),
                        Text("PREP:",style: TextStyle(fontWeight: FontWeight.w600)),
                        Container(height: 10,),
                        Text("25 min")
                      ],),
                      Spacer(),
                      Column(children: [
                        Icon(Icons.alarm_rounded,color: Colors.green[400],),
                        Text("cooks:",style: TextStyle(fontWeight: FontWeight.w600)),
                        Container(height: 10,),
                        Text("1 hr")
                      ],),
                      Spacer(),
                      Column(children: [
                        Icon(Icons.restaurant,color: Colors.green[400],),
                        Text("FEEDS:",style: TextStyle(fontWeight: FontWeight.w600)),
                        Container(height: 10,),
                        Text("4-6")
                      ],),
                      Spacer(),

                    ],
                  ),

                )
              ],


            )
        ),


      ),
    );
  }
}