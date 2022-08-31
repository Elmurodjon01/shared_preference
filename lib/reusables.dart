

import 'package:flutter/material.dart';


class Reusables {
 static Widget InputContainer (String containerHint, TextEditingController inputController, IconData containerIcon){
   return  Container(
 margin: const EdgeInsets.only(left: 20, right: 20),
 height: 50,
 padding: const EdgeInsets.only(left: 15, right: 15),
 decoration: BoxDecoration(
 borderRadius: BorderRadius.circular(25),
 color: Colors.grey[200],
 ),
 child:  TextField(
 controller: inputController,
 decoration:  InputDecoration(
 hintText: containerHint,
 border: InputBorder.none,
 icon: Icon(containerIcon, color: Colors.blue,),
 ),
 ),
 );
}


static Widget Alternative(Color color, String label){
  return Container(
   height: 40,
   width: 120,
   decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(12),
   ),
   child: Center(child:  Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),),
  );
}

}

