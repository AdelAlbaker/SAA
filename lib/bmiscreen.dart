import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saa/constant.dart';
import 'package:saa/tkllscreen.dart';

class BmiScreen extends StatelessWidget {

  late var height;
  late var weight;
  late var age;



  BmiScreen(this.age, this.weight, this.height);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 20,),

            const Text(
              "Body Mass Index",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 20,),

            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child:  Text(
                "${(double.tryParse(weight)!/((pow(double.tryParse(height) as num , 2))))*10000}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 40,),



            const Image(
                image: AssetImage("assets/images/bmiPic.jpg"),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                child: const Text(
                  "The risk of scoliosis progression may be increased in some cases with low BMI"
                "The rate of failure of orthotic treatment may be increase in cases with high BMI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: defaultButton(text: "Normal TK - LL ->", function: (){
                navigateTo(context, TkLlScreen(age));
              }) ,
            ),





          ],
        ),
      ),
    );
  }


}
