
import 'package:flutter/material.dart';
import 'package:saa/constant.dart';
import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';

import 'homescreen.dart';

class TkLlScreen extends StatelessWidget {

  late var age;

  TkLlScreen(this.age);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Thoracic Kyphosis\n"
          "Lumbar Lordosis",
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

            SizedBox(height: 50,),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children:  [
                const Text(
                  "Normal TK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),

                const SizedBox(width: 20,),

                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child:   Text(
                    "${25+(0.58*int.tryParse(age)!)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),



              ],
            ),

            SizedBox(height: 50,),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children:  [
                const Text(
                  "Normal LL",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),

                const SizedBox(width: 20,),

                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child:  Text(
                    "${24+(0.51*int.tryParse(age)!)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                child: const Text(
                  "Normal values of thoracic kyphosis and lumbar lordosis according to the age",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  defaultButton(text: "Main", function: (){
                    Navigator.pushAndRemoveUntil (
                      context,
                      MaterialPageRoute (builder: (BuildContext context) =>  const HomeScreen()) ,
                      ModalRoute.withName('/')
                    );
                  }),
                  defaultButton(text: "Exit", function: (){
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                      exit(0);
                    }
                  }),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
