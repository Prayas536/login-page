import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpagefirebase/screeens/finalpage.dart';
import 'package:loginpagefirebase/uihelper/widget.dart';

class Signin extends StatefulWidget {
  @override
  State<Signin> createState() => signstate();
}

class signstate extends State<Signin> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  signin(String email, String password) async {
    if (email == "" && password == "") {
      UiHelper.customalertbox(context, "Enter Required field");
    } else {
      // UserCredential? userCredential;
      try {
       UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => finalpage()),
              
            );
      } on FirebaseAuthException catch (ex) {
        return UiHelper.customalertbox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customTextField(
            emailcontroller,
            "Enter Email",
            Icons.mail,
            false,
          ),
          UiHelper.customTextField(
            passwordcontroller,
            "Enter Password",
            Icons.password,
            true,
          ),
          SizedBox(height: 20, width: 100),
          UiHelper.button(() {
            signin(
              emailcontroller.text.toString(),
              passwordcontroller.text.toString(),
            );
          }, "Sign IN"),
        ],
      ),
    );
  }
}
