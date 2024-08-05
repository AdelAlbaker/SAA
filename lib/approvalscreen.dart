
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saa/informationscreen.dart';

import 'constant.dart';

class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {

  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,
        title: const Text(
          "Important note",
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading:  IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children:   [


              Html(
                data:
                "The aim of designing the program is to assist<br>"
                    "specialists in the field of scoliosis treatment in<br>"
                    "determining the best appropriate treatment options,<br>"
                    "according to recommendations<br>"

                    "<b>The International Society on Scoliosis Orthopedic and Rehabilitation Treatment (SOSORT) </b><br>"
                    "All information provided is based on the table of recommendations proposed by <b>SOSORT</b>",

              ),

              SizedBox(height: 15,),

              const Text(
                "This program cannot be used as a final reference\n"
                    "for evaluating cases, and as a result of the use of\n"
                    "this program, it is not possible to dispense with\n"
                    "specialized medical consultations, medical\n"
                    "diagnosis from the specialist doctor, and\n"
                    "recommendations for each case of scoliosis by the\n"
                    "specialized medical team.",

                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),

             SizedBox(height: 50,),


             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Checkbox(
                     value: isChecked,
                     onChanged: (bool? value){
                       setState(() {
                         isChecked = value!;
                       });
                     }
                 ),
                 
                 const SizedBox(width: 10,),

                 defaultButton(text: "Agree",function: (){
                   if(isChecked)
                     {
                       navigateTo(context, InformationScreen());
                     }
                   else
                     {
                       Fluttertoast.showToast(
                           backgroundColor: Colors.red,
                           msg:
                           "You must agree to the terms Click the button to place a check mark");
                     }

                 }),
               ],
             ),


            ],
          ),
        ),
      ),
    );
  }
}

