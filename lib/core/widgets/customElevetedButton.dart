import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/view/HomePage.dart';

class CustomEevetedButton extends StatelessWidget {


   CustomEevetedButton({super.key, required this.text, required this.onPress



  });


  final String text;
   var   onPress;
  @override
  Widget build(BuildContext context) {
    return  Container(

      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(


          color: Colors.blue,
          borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed:onPress,
        child:  Text(
         text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
