import 'package:flutter/material.dart';

class UiHelper {
  // buttons function, textfield ,

  static customTextField(
    TextEditingController controller,
    String text,
    IconData icondata,
    bool tohide,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: TextField(
        controller: controller,
        obscureText: tohide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(icondata),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  static button(VoidCallback call, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(
          onPressed: call,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.deepOrange
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
             
            ),
           
          ),
        ),
      ),
    );
  }
  static customalertbox(BuildContext context,String text ){
    return showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
      );

    }
    );
  }
  
}
