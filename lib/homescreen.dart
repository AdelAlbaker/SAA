
import 'package:flutter/material.dart';
import 'package:saa/approvalscreen.dart';

import 'constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children:  [
                const Text(
                    "SAA",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w900,
                    fontSize: 35,
                  ),
                ),


                const Text(
                  "Scoliosis Assessment Aid",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30,),

                const Text(
                  "By Firas Wahbeh, Syria",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30,),

                const Image(image:AssetImage("assets/images/vertebral column.png",)),

                const SizedBox(height: 50,),

                defaultButton(text: "START", function: (){
                  navigateTo(context,  ApprovalScreen());
                }),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
