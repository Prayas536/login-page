import 'package:flutter/material.dart';

class finalpage extends StatelessWidget{
  const finalpage({super.key});
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Column(
        children: [
          Text("Thanks for using our app",style: TextStyle(
            fontSize: 20,
          ),),
          Text("Keep using it"),
        ],
      ),
    );
  }
}