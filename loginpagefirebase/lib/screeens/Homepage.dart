import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpagefirebase/screeens/finalpage.dart';
import 'package:loginpagefirebase/screeens/forgotpassword.dart';
import 'package:loginpagefirebase/uihelper/widget.dart';
import 'package:loginpagefirebase/screeens/signin.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  // BuildContext context=BuildContext;
  login(String email, String password) async {
    if (email == "" || password == "") {
      return UiHelper.customalertbox(context, "Enter required field");
    } else {
      UserCredential userCredential;
      try{
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,

      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>finalpage()));

      }
      on FirebaseAuthException catch(ex){
        return UiHelper.customalertbox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          UiHelper.customTextField(
            emailcontroller,
            'Enter Email',
            Icons.email,
            false,
          ),
          UiHelper.customTextField(
            passwordcontroller,
            "Enter Password",
            Icons.password,
            true,
          ),
          UiHelper.button(() {
            login(emailcontroller.text, passwordcontroller.text);
          }, 'Login'),

          SizedBox(height: 20, width: 50),
          Column(
            children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have a account ?', style: TextStyle(fontSize: 20)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()),
                  );
                },
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 19, color: Colors.indigoAccent),
                ),
              ),
            ],
          ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgotpassword()));
          }, child: Text("Forgot Password"))
            ],
          ),
        ],
        
      ),
    );
  }
}
