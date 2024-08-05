

import 'package:flutter/material.dart';

void navigateTo(context,Widget) =>Navigator.push(context,
  MaterialPageRoute(
    builder: (context)=>  Widget,
  ),
);



Widget defaultButton ({
  double width=170,
  Color background=Colors.white30,
  bool isUpperCase=true,
  double radius= 20,
  required String text,
  required Null Function() function,

}) =>  Container(

  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius,),
   border: Border.all(color: Colors.blueAccent,width: 4),
    color: background,
  ),

  child: MaterialButton(

    onPressed: function,
    child:  Text(

      isUpperCase? text.toUpperCase():text,

      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,

      ),
    ),
  ),
);



Widget defaultFormField(
    {
      bool isPassword = false,
      required TextEditingController controller,
      required TextInputType type,
      required String label,
      required IconData prefix,
      IconData? suffix,

      required dynamic Function(dynamic value) onSubmit,

      required String? Function(dynamic value) validate,

      dynamic Function()? suffixPressed,

      dynamic Function(String)? onChange,

      dynamic Function()? onTap,

      bool isClickable = true,

    })=>TextFormField(
  cursorColor: Colors.blueAccent,
  textDirection: TextDirection.ltr,
  enabled: isClickable,
  obscureText: isPassword,
  controller:controller ,
  onChanged:onChange,
  onTap: onTap,
  keyboardType:type,
  validator: validate,
  onFieldSubmitted: onSubmit ,
  decoration:  InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.grey),

    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 2,
      ),
    ),
    focusedBorder:const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 2,
      ),
    ),
    prefixIcon: Icon(
      prefix,
      color: Colors.blueAccent,
    ),
    suffixIcon: suffix != null? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,
        color: Colors.blueAccent,
      ),
    ): null,
  ),
);
