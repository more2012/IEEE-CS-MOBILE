import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'bmi_result_screen.dart';

class BmiScreen extends StatefulWidget{
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double height =150;
  double weight =90;
  double age =23;
  bool isClick = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#0d1232"),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Bmi Calculator",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///Gender
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(   // GestureDetector or InkWell
                    onTap: (){
                      setState(() {
                        isClick=true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: isClick?Colors.blue : HexColor('#252a48'),
                          borderRadius: BorderRadius.circular(20)),
                      width: 170,
                      height: 170,
                      //color: HexColor('#252a48'), in decoration
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/male-gender.png",
                              height: 80,
                              width: 80,
                              color: Colors.white,
                              ),
                            SizedBox(height:10),
                            Text('Male',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),)

                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isClick=false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: !isClick?Colors.blue : HexColor('#252a48'),
                          borderRadius: BorderRadius.circular(20)),
                      width: 170,
                      height: 170,
                      //color: HexColor('#252a48'), in decoration
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/femenine.png",
                              height: 80,
                              width: 80,
                              color: Colors.white,
                            ),
                            SizedBox(height:10),
                            Text('Female',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),)

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              ///Height & Slider
              Container(
                decoration: BoxDecoration(
                    color: HexColor('#252a48'),
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Height',style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,// instead of RichText and TextSpan
                        textBaseline:TextBaseline.alphabetic ,
                        children: [
                          Text('${height.toInt()}',style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          Text('CM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              ),)
                        ],
                      ),
                      Slider(
                          value: height,
                          min: 60,
                          max: 220,
                          activeColor: Colors.red,
                          onChanged: (val){
                            setState(() {
                              height = val;
                            });
                          })
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              /// Weight & Age
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: HexColor('#252a48'),
                        borderRadius: BorderRadius.circular(20)),
                    width: 170,
                    height: 200,
                    //color: HexColor('#252a48'), in decoration
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Weight',style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                          Text('${weight.toInt()}',style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor:HexColor('#0d1232'),
                                child: IconButton(onPressed: (){
                                  weight++;
                                  setState(() {
                                  });
                                },
                                  icon: Icon(Icons.add),
                                  color: Colors.white,),
                              ),
                              CircleAvatar(
                                backgroundColor:HexColor('#0d1232'),
                                child: IconButton(onPressed: (){
                                  weight--;
                                  setState(() {
                                  });
                                },
                                  icon: Icon(Icons.remove),
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: HexColor('#252a48'),
                        borderRadius: BorderRadius.circular(20)),
                    width: 170,
                    height: 200,
                    //color: HexColor('#252a48'), in decoration
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Age',style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                          Text('${age.toInt()}',style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor:HexColor('#0d1232'),
                                child: IconButton(onPressed: (){
                                  age++;
                                  setState(() {
                                  });
                                },
                                  icon: Icon(Icons.add),
                                  color: Colors.white,),
                              ),
                              CircleAvatar(
                                backgroundColor:HexColor('#0d1232'),
                                child: IconButton(onPressed: (){
                                  age--;
                                  setState(() {
                                  });
                                },
                                  icon: Icon(Icons.remove),
                                  color: Colors.white,),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
          
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red
                ),
                child: MaterialButton(onPressed: (){
                  double result = weight / pow(height/100,2);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)   ///(context) =>BmiResultScreen()
                      {return BmiResultScreen(gender: isClick ? 'Male':'Female',
                        result: result.toInt(),
                        age: age.toInt(),
                      );}));  /// Go to another Screen
                },child: Text("Check Your BMI",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),),
              )
            ],
          ),
        ),
      ),
    );

  }
}