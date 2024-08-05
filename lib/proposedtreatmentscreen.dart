import 'package:flutter/material.dart';
import 'package:saa/bmiscreen.dart';
import 'package:saa/progressionriskscreen.dart';
import 'package:saa/tkllscreen.dart';

import 'constant.dart';

class ProposedTreatmentScreen extends StatelessWidget {

  late var age;
  late var cobbAngle;
  late var height;
  late var weight;
  late var risser;

  late var min;
  late var max;

   String progressionRisk="";

  ProposedTreatmentScreen(
      this.age,
      this.cobbAngle,
      this.height,
      this.weight,
      this.risser,
      this.min,
      this.max,
      {super.key}
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:   const Text(
          "Proposed Treatment\n"
              " Solution",
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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children:  [

              const SizedBox(height: 60,),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    const Text(
                        "Min",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child:  Text(
                          "$min",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              ),

              const SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,

                  children:  [

                    const Text(
                      "Max",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child:  Text(
                          "$max",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              ),

              const SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Text(

                    "The opinion and diagnosis of the specialist doctor,"
                    "and the recommendations of the specialized medical"
                  "team is the basis for providing appropriate treatment options for each case",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60,),


              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: (int.tryParse(age)! >= 8 && int.tryParse(age)! <= 16)?
                defaultButton(text: "Progression Risk % ->", function: (){
                  prigRisk();
                  navigateTo(context, ProgressionRiskScreen(age, cobbAngle, height, weight, risser, min,progressionRisk));
                })
                :(int.tryParse(age)! < 8)?
                defaultButton(text: "NORMAL TK-LL ->", function: (){
                  navigateTo(context, TkLlScreen(age));
                }) :defaultButton(text: "Body Mass Index ->", function: (){
                  navigateTo(context, BmiScreen(age, weight, height));
                }),

              ),

            ],
          ),
        ),
      ),
    );
  }

  void prigRisk()
  {

    if(int.tryParse(age)! >= 0 && int.tryParse(age)! <=10)
      {
        if(risser=="Risser 0")
        {
          if(double.tryParse(cobbAngle)!>=11 && double.tryParse(cobbAngle)! <= 15)
          {
            progressionRisk="20%";
          }
          else if(double.tryParse(cobbAngle)! >=16 && double.tryParse(cobbAngle)! <=19)
          {
            progressionRisk="25%";
          }
          else
          {
            progressionRisk="100%";
          }
        }
      }
    else if(int.tryParse(age)! >=11 && int.tryParse(age)! <=12)
      {
        if(risser=="Risser 0")
        {
          if(double.tryParse(cobbAngle)!>=11 && double.tryParse(cobbAngle)! <= 15)
          {
            progressionRisk="20%";
          }
          else if(double.tryParse(cobbAngle)! >=16 && double.tryParse(cobbAngle)! <=19)
          {
            progressionRisk="25%";
          }
          else
          {
            progressionRisk="100%";
          }
        }
        else if(risser=="Risser 1")
          {
            if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)!<=15)
              {
                progressionRisk="15%";
              }
            else if(double.tryParse(cobbAngle)! >=16 && double.tryParse(cobbAngle)!<= 19)
              {
                progressionRisk="20%";
              }
            else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=25)
              {
                progressionRisk="80%";
              }
            else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)! <=27)
              {
                progressionRisk="90%";
              }
            else if(double.tryParse(cobbAngle)! >=28 && double.tryParse(cobbAngle)! <=29)
              {
                progressionRisk="95%";
              }
            else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)!<=33)
              {
                progressionRisk="98%";
              }
            else
              {
                progressionRisk="100%";
              }



          }

      }
    else if(int.tryParse(age)! ==13)
      {
        if(risser=="Risser 1")
        {
          if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)!<=15)
          {
            progressionRisk="15%";
          }
          else if(double.tryParse(cobbAngle)! >=16 && double.tryParse(cobbAngle)!<= 19)
          {
            progressionRisk="20%";
          }
          else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=25)
          {
            progressionRisk="80%";
          }
          else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)! <=27)
          {
            progressionRisk="90%";
          }
          else if(double.tryParse(cobbAngle)! >=28 && double.tryParse(cobbAngle)! <=29)
          {
            progressionRisk="95%";
          }
          else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)!<=33)
          {
            progressionRisk="98%";
          }
          else
          {
            progressionRisk="100%";
          }



        }
        else if(risser=="Risser 2")
          {
            if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)! <=19)
              {
                progressionRisk="15%";
              }
            else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)!<=21)
              {
                progressionRisk="10";
              }
            else if(double.tryParse(cobbAngle)! >=22 && double.tryParse(cobbAngle)! <=23)
              {
                progressionRisk="15%";
              }
            else if(double.tryParse(cobbAngle)! >=24 && double.tryParse(cobbAngle)!<=25)
              {
                progressionRisk="35%";
              }
            else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)!<=27)
              {
                progressionRisk="45%";
              }
            else if(double.tryParse(cobbAngle)! >=28 && double.tryParse(cobbAngle)!<=29)
              {
                progressionRisk="55%";
              }
            else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)! <=33)
              {
                progressionRisk="70%";
              }
            else if(double.tryParse(cobbAngle)! >=34 && double.tryParse(cobbAngle)! <=35)
              {
                progressionRisk="90%";
              }
            else if(double.tryParse(cobbAngle)!>=36 && double.tryParse(cobbAngle)! <=37)
              {
                progressionRisk="95%";
              }
            else if(double.tryParse(cobbAngle)!>=38 && double.tryParse(cobbAngle)!<=39)
              {
                progressionRisk="98%";
              }
            else
              {
                progressionRisk="100%";
              }

          }

      }
    else if(int.tryParse(age)! ==14)
      {
        if(risser=="Risser 1")
        {
          if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)!<=15)
          {
            progressionRisk="15%";
          }
          else if(double.tryParse(cobbAngle)! >=16 && double.tryParse(cobbAngle)!<= 19)
          {
            progressionRisk="20%";
          }
          else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=25)
          {
            progressionRisk="80%";
          }
          else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)! <=27)
          {
            progressionRisk="90%";
          }
          else if(double.tryParse(cobbAngle)! >=28 && double.tryParse(cobbAngle)! <=29)
          {
            progressionRisk="95%";
          }
          else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)!<=33)
          {
            progressionRisk="98%";
          }
          else
          {
            progressionRisk="100%";
          }



        }
        if(risser=="Risser 2")
          {
            if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)! <=19)
              {
                progressionRisk="5%";
              }
            else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=21)
              {
                progressionRisk="10%";
              }
            else if(double.tryParse(cobbAngle)! >=22 && double.tryParse(cobbAngle)! <=23)
              {
                progressionRisk="15%";
              }
            else if(double.tryParse(cobbAngle)! >=24 && double.tryParse(cobbAngle)! <=25)
              {
                progressionRisk="35%";
              }
            else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)! <= 27)
              {
                progressionRisk="45%";
              }
            else if(double.tryParse(cobbAngle)! >= 28 && double.tryParse(cobbAngle)! <= 29)
              {
                progressionRisk="55%";
              }
            else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)! <=33)
              {
                progressionRisk="70%";
              }
            else if(double.tryParse(cobbAngle)! >=34 && double.tryParse(cobbAngle)! <=35)
              {
                progressionRisk="90%";
              }
            else if(double.tryParse(cobbAngle)! >=36 && double.tryParse(cobbAngle)! <=37)
              {
                progressionRisk="95%";
              }
            else if(double.tryParse(cobbAngle)! >=38 && double.tryParse(cobbAngle)! <=39)
              {
                progressionRisk="98%";
              }
            else{
              progressionRisk="100%";
            }

          }
      }
    else if(int.tryParse(age)! ==15)
      {
        if(risser=="Risser 1")
        {
          if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)!<=15)
          {
            progressionRisk="15%";
          }
          else if(double.tryParse(cobbAngle)! >=16 && double.tryParse(cobbAngle)!<= 19)
          {
            progressionRisk="20%";
          }
          else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=25)
          {
            progressionRisk="80%";
          }
          else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)! <=27)
          {
            progressionRisk="90%";
          }
          else if(double.tryParse(cobbAngle)! >=28 && double.tryParse(cobbAngle)! <=29)
          {
            progressionRisk="95%";
          }
          else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)!<=33)
          {
            progressionRisk="98%";
          }
          else
          {
            progressionRisk="100%";
          }



        }
        if(risser=="Risser 2")
        {
          if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)! <=19)
          {
            progressionRisk="5%";
          }
          else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=21)
          {
            progressionRisk="10%";
          }
          else if(double.tryParse(cobbAngle)! >=22 && double.tryParse(cobbAngle)! <=23)
          {
            progressionRisk="15%";
          }
          else if(double.tryParse(cobbAngle)! >=24 && double.tryParse(cobbAngle)! <=25)
          {
            progressionRisk="35%";
          }
          else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)! <= 27)
          {
            progressionRisk="45%";
          }
          else if(double.tryParse(cobbAngle)! >= 28 && double.tryParse(cobbAngle)! <= 29)
          {
            progressionRisk="55%";
          }
          else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)! <=33)
          {
            progressionRisk="70%";
          }
          else if(double.tryParse(cobbAngle)! >=34 && double.tryParse(cobbAngle)! <=35)
          {
            progressionRisk="90%";
          }
          else if(double.tryParse(cobbAngle)! >=36 && double.tryParse(cobbAngle)! <=37)
          {
            progressionRisk="95%";
          }
          else if(double.tryParse(cobbAngle)! >=38 && double.tryParse(cobbAngle)! <=39)
          {
            progressionRisk="98%";
          }
          else{
            progressionRisk="100%";
          }

        }
        if(risser=="Risser 3")
          {
            if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)! <=19)
              {
                progressionRisk="0%";
              }
            else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=21)
              {
                progressionRisk="3%";
              }
            else if(double.tryParse(cobbAngle)! >=22 && double.tryParse(cobbAngle)! <=23)
              {
                progressionRisk="5%";
              }
            else if(double.tryParse(cobbAngle)! >= 24 && double.tryParse(cobbAngle)! <=25)
              {
                progressionRisk="10%";
              }
            else if(double.tryParse(cobbAngle)! >= 26 && double.tryParse(cobbAngle)! <= 27)
              {
                progressionRisk="20%";
              }
            else if(double.tryParse(cobbAngle)! >=28 && double.tryParse(cobbAngle)! <= 31)
              {
                progressionRisk="25%";
              }
            else if(double.tryParse(cobbAngle)! >= 32 && double.tryParse(cobbAngle)! <=35)
              {
                progressionRisk="30%";
              }
            else if(double.tryParse(cobbAngle)! >=36 && double.tryParse(cobbAngle)! <=37)
              {
                progressionRisk="50%";
              }
            else if(double.tryParse(cobbAngle)! >= 38 && double.tryParse(cobbAngle)! <= 39)
              {
                progressionRisk="70%";
              }
            else if(double.tryParse(cobbAngle)! >=40 && double.tryParse(cobbAngle)! <=41)
              {
                progressionRisk="80%";
              }
            else if(double.tryParse(cobbAngle)! >=42 && double.tryParse(cobbAngle)! <=43)
              {
                progressionRisk="90%";
              }
            else
              {
                progressionRisk="100";
              }


          }
      }
    else if(int.tryParse(age)! ==16)
      {
        if(risser=="Risser 1")
        {
          if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)!<=15)
          {
            progressionRisk="15%";
          }
          else if(double.tryParse(cobbAngle)! >=16 && double.tryParse(cobbAngle)!<= 19)
          {
            progressionRisk="20%";
          }
          else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=25)
          {
            progressionRisk="80%";
          }
          else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)! <=27)
          {
            progressionRisk="90%";
          }
          else if(double.tryParse(cobbAngle)! >=28 && double.tryParse(cobbAngle)! <=29)
          {
            progressionRisk="95%";
          }
          else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)!<=33)
          {
            progressionRisk="98%";
          }
          else
          {
            progressionRisk="100%";
          }



        }
        if(risser=="Risser 2")
        {
          if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)! <=19)
          {
            progressionRisk="5%";
          }
          else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=21)
          {
            progressionRisk="10%";
          }
          else if(double.tryParse(cobbAngle)! >=22 && double.tryParse(cobbAngle)! <=23)
          {
            progressionRisk="15%";
          }
          else if(double.tryParse(cobbAngle)! >=24 && double.tryParse(cobbAngle)! <=25)
          {
            progressionRisk="35%";
          }
          else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)! <= 27)
          {
            progressionRisk="45%";
          }
          else if(double.tryParse(cobbAngle)! >= 28 && double.tryParse(cobbAngle)! <= 29)
          {
            progressionRisk="55%";
          }
          else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)! <=33)
          {
            progressionRisk="70%";
          }
          else if(double.tryParse(cobbAngle)! >=34 && double.tryParse(cobbAngle)! <=35)
          {
            progressionRisk="90%";
          }
          else if(double.tryParse(cobbAngle)! >=36 && double.tryParse(cobbAngle)! <=37)
          {
            progressionRisk="95%";
          }
          else if(double.tryParse(cobbAngle)! >=38 && double.tryParse(cobbAngle)! <=39)
          {
            progressionRisk="98%";
          }
          else{
            progressionRisk="100%";
          }

        }
        if(risser=="Risser 3")
        {
          if(double.tryParse(cobbAngle)! >=11 && double.tryParse(cobbAngle)! <=19)
          {
            progressionRisk="0%";
          }
          else if(double.tryParse(cobbAngle)! >=20 && double.tryParse(cobbAngle)! <=21)
          {
            progressionRisk="3%";
          }
          else if(double.tryParse(cobbAngle)! >=22 && double.tryParse(cobbAngle)! <=23)
          {
            progressionRisk="5%";
          }
          else if(double.tryParse(cobbAngle)! >= 24 && double.tryParse(cobbAngle)! <=25)
          {
            progressionRisk="10%";
          }
          else if(double.tryParse(cobbAngle)! >= 26 && double.tryParse(cobbAngle)! <= 27)
          {
            progressionRisk="20%";
          }
          else if(double.tryParse(cobbAngle)! >=28 && double.tryParse(cobbAngle)! <= 31)
          {
            progressionRisk="25%";
          }
          else if(double.tryParse(cobbAngle)! >= 32 && double.tryParse(cobbAngle)! <=35)
          {
            progressionRisk="30%";
          }
          else if(double.tryParse(cobbAngle)! >=36 && double.tryParse(cobbAngle)! <=37)
          {
            progressionRisk="50%";
          }
          else if(double.tryParse(cobbAngle)! >= 38 && double.tryParse(cobbAngle)! <= 39)
          {
            progressionRisk="70%";
          }
          else if(double.tryParse(cobbAngle)! >=40 && double.tryParse(cobbAngle)! <=41)
          {
            progressionRisk="80%";
          }
          else if(double.tryParse(cobbAngle)! >=42 && double.tryParse(cobbAngle)! <=43)
          {
            progressionRisk="90%";
          }
          else
          {
            progressionRisk="100";
          }


        }

        if(risser=="Risser 4")
          {
            if(double.tryParse(cobbAngle)! >= 11 && double.tryParse(cobbAngle)! <= 23)
              {
                progressionRisk="0%";
              }
            else if(double.tryParse(cobbAngle)! >= 24 && double.tryParse(cobbAngle)! <=25)
              {
                progressionRisk="3%";
              }
            else if(double.tryParse(cobbAngle)! >=26 && double.tryParse(cobbAngle)! <=27)
              {
                progressionRisk="8%";
              }
            else if(double.tryParse(cobbAngle)! >=28 && double.tryParse(cobbAngle)! <=29)
              {
                progressionRisk="10%";
              }
            else if(double.tryParse(cobbAngle)! >=30 && double.tryParse(cobbAngle)! <= 31)
              {
                progressionRisk="12%";
              }
            else if(double.tryParse(cobbAngle)! >=32 && double.tryParse(cobbAngle)! <=35)
              {
                progressionRisk="20%";
              }
            else if(double.tryParse(cobbAngle)! >= 36 && double.tryParse(cobbAngle)! <= 39)
              {
                progressionRisk="25%";
              }
            else if(double.tryParse(cobbAngle)! >=40 && double.tryParse(cobbAngle)! <= 43)
              {
                progressionRisk="30%";
              }
            else if(double.tryParse(cobbAngle)! >= 44 && double.tryParse(cobbAngle)! <=47)
              {
                progressionRisk="35";
              }
            else if(double.tryParse(cobbAngle)! >= 48 && double.tryParse(cobbAngle)! <=49)
              {
                progressionRisk="40%";
              }
            else
              {
                progressionRisk="50%";
              }

          }
      }

  }


}
