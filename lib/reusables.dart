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
static Widget CustomButton(String label){
  return Container(
   margin: const EdgeInsets.only(left: 20, right: 20),
   height: 55,
   width: 200,
   decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(35),
       color: Colors.blue[900],
   ),
   child: Center(
    child: Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
   ),
  );
}

static Widget Alternative(){
  return Container(
   height: 30,
   width: 170,
   child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4p-IHEBY4wJr2kSxFgjAwfguMQ9UH-RlAaIJM3FeibMOaUXoaTiRABeqT16vLaI8cwQ&usqp=CAU'),
  );
}
}