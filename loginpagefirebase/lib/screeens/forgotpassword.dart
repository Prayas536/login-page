import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpagefirebase/uihelper/widget.dart';

class Forgotpassword extends StatefulWidget{

  @override
  State<Forgotpassword> createState() {
   
    return forgotstate();
  }
}
class forgotstate extends State<Forgotpassword>{
  final TextEditingController emailcontroller=TextEditingController();
  Future<void>  resetpassword() async{
    try{
   
     await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text.trim());
     UiHelper.customalertbox(context, "Reset link is sent");
    }
    on FirebaseAuthException catch(ex){
      UiHelper.customalertbox(context, ex.message.toString());
    }
  }

@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customTextField(emailcontroller, "Enter Email id", Icons.email, false),
          UiHelper.button((){
            resetpassword();

          }, "OK")
        ],
      ),

    );
  }
}