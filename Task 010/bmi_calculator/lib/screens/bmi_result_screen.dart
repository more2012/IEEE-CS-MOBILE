import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'bmi_screen.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.gender, required this.result, required this.age});
  final String gender;
  final int result;
  final  int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#0d1232"),
      appBar: AppBar(

        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>BmiScreen()));
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title:  Text('BMI RESULT',
          style: TextStyle(
              color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color:  HexColor('#252a48'),
                  borderRadius: BorderRadius.circular(20)),
              width: 200,
              height: 100,
              child: Center(
                child: Text('Gender: $gender',
                  style: TextStyle(
                      color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                  color:  HexColor('#252a48'),
                  borderRadius: BorderRadius.circular(20)),
              width: 200,
              height: 100,
              child: Center(
                child: Text("Result: $result",
                  style: TextStyle(
                      color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                  color:  HexColor('#252a48'),
                  borderRadius: BorderRadius.circular(20)),
              width: 200,
              height: 100,
              child: Center(
                child: Text("Age: $age",
                  style: TextStyle(
                      color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
