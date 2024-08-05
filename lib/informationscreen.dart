import 'package:flutter/material.dart';
import 'package:saa/proposedtreatmentscreen.dart';

import 'constant.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {

  var age=TextEditingController();
  var cobbAngle=TextEditingController();
  var risserSign=TextEditingController();
  var height=TextEditingController();
  var weight=TextEditingController();
  var formKey = GlobalKey<FormState>();

  List<String> genderList=['Male','Female'];
  List<String> risserList=["Risser 0","Risser 1","Risser 2","Risser 3","Risser 4","Risser 4-5"];
  List<String> painAdultList=["No pain","Chronic Pain"];
  List<String> painElderlyList=["No pain","Chronic Pain","Decompensation"];

  late String genderValue = genderList.first;
  late String risserValue=risserList.first;
  late String painAdultValue=painAdultList.first;
  late String painElderlyValue=painElderlyList.first;


  bool risserIsClick=false;
  bool painAdultIsClick=false;
  bool painElderlyIsClick=false;

  late String min;
  late String max;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,
        title: const Text(
          "Information",
          style: TextStyle(
            color: Colors.black
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
          padding: const EdgeInsets.all(15),
          child: Form(
            key:formKey,
            child: Column(
              children: [

                Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Text(
                    "Please include the information in numbers according to the appropriate field",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 15,),


                defaultFormField(
                  controller: age,
                  label:"Age in years" ,
                  prefix: Icons.date_range,
                  type: const TextInputType.numberWithOptions(),
                  onSubmit: (val){},
                  validate: (val){
                    if(val.toString().isEmpty)
                      {
                        return "Age cannot be empty";
                      }
                    if(int.tryParse(val)!<= 0)
                      {
                        return "Age cannot be less than or equal to zero";
                      }
                    return null;

                  },
                  onChange: (val){

                    if(val.isNotEmpty)
                      {
                        if(int.tryParse(val)!<10 || int.tryParse(val)!>18)
                        {
                          risserIsClick=false;
                        }
                        else
                          {
                            risserIsClick=true;
                          }

                        if(int.tryParse(val)! < 19 || int.tryParse(val)! > 60)
                          {
                            painAdultIsClick=false;
                          }
                        else
                        {
                          painAdultIsClick=true;
                        }


                        if(int.tryParse(val)! <= 60)
                          {
                            painElderlyIsClick=false;
                          }
                        else
                          {
                            painElderlyIsClick=true;
                          }
                      }

                    setState(() {

                    });
                  },
                ),

                const SizedBox(height: 15,),


                defaultFormField(
                  controller: cobbAngle,
                  label:"cobb Angle" ,
                  prefix: Icons.numbers,
                  type: const TextInputType.numberWithOptions(decimal: true),
                  onSubmit: (val){},
                  validate: (val){
                    if(val.toString().isEmpty)
                    {
                      return "cobb Angle cannot be empty";
                    }

                    if(double.tryParse(val)!<= 0)
                      {
                        return "cobb Angle cannot be less than or equal to zero";
                      }

                      return null;
                  },
                ),

                const SizedBox(height: 15,),

                defaultFormField(
                  controller: height,
                  label:"Height in CM",
                  prefix: Icons.numbers,
                  type: const TextInputType.numberWithOptions(),
                  onSubmit: (val){},
                  validate: (val){
                    if(val.toString().isEmpty)
                    {
                      return "Height cannot be empty";
                    }

                    if(double.tryParse(val)!<= 0)
                    {
                      return "Height cannot be less than or equal to zero";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15,),


                defaultFormField(
                  controller: weight,
                  label:"Weight in kilogram" ,
                  prefix: Icons.numbers,
                  type: const TextInputType.numberWithOptions(),
                  onSubmit: (val){},
                  validate: (val){
                    if(val.toString().isEmpty)
                    {
                      return "Weight cannot be empty";
                    }

                    if(double.tryParse(val)!<= 0)
                    {
                      return "Weight cannot be less than or equal to zero";
                    }

                    return null;
                  },
                ),

               const SizedBox(height: 15,),

               Container(
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.grey),
                 ),
                 child: Row(

                   mainAxisAlignment: MainAxisAlignment.center,
                   children:  [
                     const Text("Gender "),
                     DropdownButton(
                       alignment: AlignmentDirectional.center,
                         value: genderValue,
                         items: genderList.map<DropdownMenuItem<String>>((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             child: Text(value,style: const TextStyle(color: Colors.black),),
                           );
                         }).toList(),

                         onChanged: (String? value) {
                           // This is called when the user selects an item.
                           setState(() {
                             genderValue = value!;
                           });
                         }),
                   ],
                 ),
               ),

                const SizedBox(height: 15,),


                !risserIsClick?
                    Container(
                      height: 0,
                    )
                :
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Riser "),
                      IgnorePointer(
                        ignoring: false,
                        child: DropdownButton(
                          alignment: AlignmentDirectional.center,
                          value: risserValue,
                          items: risserList.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: const TextStyle(color: Colors.black),),
                            );
                          }).toList(),

                          onChanged: (String? value){
                            setState(() {
                              risserValue=value!;
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),

                !painAdultIsClick?
                    Container(height: 0,)
                :
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Pain "),
                      IgnorePointer(
                        ignoring: false,
                        child: DropdownButton(
                          alignment: AlignmentDirectional.center,
                          value: painAdultValue,
                          items: painAdultList.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: const TextStyle(color: Colors.black),),
                            );
                          }).toList(),

                          onChanged: (String? value){
                            setState(() {
                              painAdultValue=value!;
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),



                !painElderlyIsClick?
                Container(height: 0,)
                    :
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Pain "),
                      IgnorePointer(
                        ignoring: false,
                        child: DropdownButton(
                          alignment: AlignmentDirectional.center,
                          value: painElderlyValue,
                          items: painElderlyList.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: const TextStyle(color: Colors.black),),
                            );
                          }).toList(),

                          onChanged: (String? value){
                            setState(() {
                              painElderlyValue=value!;
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),




                const SizedBox(height: 30,),


               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 width: double.infinity,
                 child: defaultButton(
                     text: "Calculate",
                     function: (){
                       if(formKey.currentState!.validate())
                       {



                         if(int.tryParse(age.text)! >= 0 && int.tryParse(age.text)!<=3)
                         {
                           if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                           {
                             min="Observe 6";
                             max="Observe 3";
                           }
                           else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                           {
                             min="Observe 6";
                             max="Observe 3";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                           {
                             min="Observe 3";
                             max="Part Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                           {
                             min="Soft Shell Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                           {
                             min="Soft Shell Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                           {
                             min="Soft Shell Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                           {
                             min="Soft Shell Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                           {
                             min="Soft Shell Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                           {
                             min="Part Time Rigid Bracing";
                             max="Surgery";
                           }
                           else
                           {
                             min="Full Time Rigid Bracing";
                             max="Surgery";
                           }
                         }


                         else if(int.tryParse(age.text)! >= 4 && int.tryParse(age.text)! <= 10)
                         {

                           if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                           {
                             min="Observe 3";
                             max="Physiotherapeutic Specific Exercises";
                           }
                           else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                           {
                             min="Observe 3";
                             max="Physiotherapeutic Specific Exercises";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                           {
                             min="Observe 3";
                             max="Part Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                           {
                             min="Soft Shell Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                           {
                             min="Soft Shell Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                           {
                             min="Soft Shell Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                           {
                             min="Part Time Rigid Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                           {
                             min="Part Time Rigid Bracing";
                             max="Full Time Rigid Bracing";
                           }

                           else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                           {
                             min="Part Time Rigid Bracing";
                             max="Surgery";
                           }
                           else
                           {
                             min="Full Time Rigid Bracing";
                             max="Surgery";
                           }

                         }

                         else if(int.tryParse(age.text)! >=11 && int.tryParse(age.text)! <=18 )
                         {
                           if(risserValue=="Risser 0" || risserValue=="Risser 1")
                           {

                             if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                             {
                               min="Observe 6";
                               max="Observe 3";
                             }
                             else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                             {
                               min="Observe 6";
                               max="Physiotherapeutic Specific Exercises";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                             {
                               min="Observe 3";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                             {
                               min="Soft Shell Bracing";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Surgery";
                             }
                             else
                             {
                               min="Full Time Rigid Bracing";
                               max="Surgery";
                             }

                           }

                           else if(risserValue=="Risser 2")
                           {
                             if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                             {
                               min="Observe 8";
                               max="Observe 6";
                             }
                             else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                             {
                               min="Observe 6";
                               max="Physiotherapeutic Specific Exercises";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                             {
                               min="Observe 3";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                             {
                               min="Soft Shell Bracing";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                             {
                               min="Soft Shell Bracing";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                             {
                               min="Soft Shell Bracing";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                             {
                               min="Soft Shell Bracing";
                               max="Surgery";
                             }
                             else
                             {
                               min="Full Time Rigid Bracing";
                               max="Surgery";
                             }
                           }

                           else if(risserValue=="Risser 3")
                           {

                             if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                             {
                               min="Observe 12";
                               max="Observe 6";
                             }
                             else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                             {
                               min="Observe 6";
                               max="Physiotherapeutic Specific Exercises";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                             {
                               min="Observe 6";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                             {
                               min="Observe 6";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                             {
                               min="Soft Shell Bracing";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                             {
                               min="Soft Shell Bracing";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                             {
                               min="Soft Shell Bracing";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                             {
                               min="Soft Shell Bracing";
                               max="Surgery";
                             }
                             else
                             {
                               min="Full Time Rigid Bracing";
                               max="Surgery";
                             }

                           }

                           else
                           {
                             if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                             {
                               min="No";
                               max="Observe 12";
                             }
                             else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                             {
                               min="Observe 6";
                               max="Physiotherapeutic Specific Exercises";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                             {
                               min="Observe 6";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                             {
                               min="Observe 6";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                             {
                               min="Observe 6";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                             {
                               min="Observe 6";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                             {
                               min="Observe 6";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                             {
                               min="Observe 6";
                               max="Full Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                             {
                               min="Soft Shell Bracing";
                               max="Surgery";
                             }
                             else
                             {
                               min="Full Time Rigid Bracing";
                               max="Surgery";
                             }

                           }

                         }

                         else if(int.tryParse(age.text)! >=19 && int.tryParse(age.text)! <=60)
                         {
                           if(painAdultValue=="No pain")
                           {

                             if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                             {
                               min="No";
                               max="Observe 12";
                             }
                             else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                             {
                               min="Observe 12";
                               max="Observe 6";
                             }
                             else
                             {
                               min="Observe 12";
                               max="Observe 6";
                             }

                           }

                           else if(painAdultValue=="Chronic Pain")
                           {

                             if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                             {
                               min="No";
                               max="Part Time Rigid Bracing";
                             }
                             else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Surgery";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Surgery";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Surgery";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Surgery";
                             }
                             else
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Surgery";
                             }
                           }

                         }
                         else
                         {
                           if(painElderlyValue=="No pain")
                           {
                             if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                             {
                               min="No";
                               max="Observe 12";
                             }
                             else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                             {
                               min="No";
                               max="Observe 12";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                             {
                               min="Observe 12";
                               max="Observe 6";
                             }
                             else
                             {
                               min="Observe 12";
                               max="Observe 6";
                             }

                           }
                           else if(painElderlyValue=="Chronic Pain")
                           {
                             if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                             {
                               min="No";
                               max="Part Time Rigid Bracing";
                             }
                             else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Surgery";
                             }
                             else
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Surgery";
                             }

                           }
                           else
                           {
                             if(double.tryParse(cobbAngle.text)!>= 0 && double.tryParse(cobbAngle.text)! <=10)
                             {
                               min="No";
                               max="Part Time Rigid Bracing";
                             }
                             else if(double.tryParse(cobbAngle.text)! >=11 && double.tryParse(cobbAngle.text)! <=15)
                             {
                               min="No";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=16 && double.tryParse(cobbAngle.text)! <=20)
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=21 && double.tryParse(cobbAngle.text)! <=25)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=26 && double.tryParse(cobbAngle.text)! <=30)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=31 && double.tryParse(cobbAngle.text)! <=35)
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=36 && double.tryParse(cobbAngle.text)! <=40)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=41 && double.tryParse(cobbAngle.text)! <=45)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Part Time Rigid Bracing";
                             }

                             else if(double.tryParse(cobbAngle.text)! >=46 && double.tryParse(cobbAngle.text)! <=50)
                             {
                               min="Physiotherapeutic Specific Exercises,";
                               max="Surgery";
                             }
                             else
                             {
                               min="Physiotherapeutic Specific Exercises";
                               max="Surgery";
                             }
                           }
                         }


                         print(min +"   "+max+"      R="+risserValue);


                         navigateTo(context, ProposedTreatmentScreen(age.text, cobbAngle.text, height.text, weight.text, risserValue, min, max));
                       }

                     }
                 ),
               ),

















              ],
            ),
          ),
        ),
      ),
    );
  }
}
