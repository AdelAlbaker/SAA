import 'package:flutter/material.dart';
import 'package:saa/bmiscreen.dart';
import 'package:saa/constant.dart';
import 'package:saa/tkllscreen.dart';

class ProgressionRiskScreen extends StatelessWidget {

  late var age;
  late var cobbAngle;
  late var height;
  late var weight;
  late var risser;
  late var progressionRisk;

  late var min;
  late var max;

  ProgressionRiskScreen(
      this.age,
      this.cobbAngle,
      this.height,
      this.weight,
      this.risser,
      this.min,
      this.progressionRisk
      );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Progression Risk %",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
        leading:  IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 60,),

              Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child:  Text(
                  "$progressionRisk",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 5,),
              Container(
                child: (progressionRisk.toString().isEmpty)?
                  const Text(
                    "There was an error selecting a Riser.\n"
                     "Please go back and select a correct Riser",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),

                  ):Container(),
              ),

              SizedBox(height: 55,),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Text(
                    "Scoliosis is common in families."
                  "The risk of progression may increase to first-degree relatives of 11% compared to 2.4% and 1.4% in"
                  "second- and third-degree relatives.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),  
              ),
              
              SizedBox(height: 60,),



              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child:(int.tryParse(age)! >=8 && int.tryParse(age)!<=9)?
                    defaultButton(text: "NORMAL TK-LL ->", function: (){
                      navigateTo(context, TkLlScreen(age));
                    }):
                defaultButton(text: "Body Mass Index ->", function: (){
                  navigateTo(context, BmiScreen(age, weight, height));
                }),
              ),
              


            ],
          ),
        ),
      ),
    );
  }
}
