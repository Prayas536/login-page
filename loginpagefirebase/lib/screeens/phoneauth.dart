import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpagefirebase/screeens/otpscreen.dart';
import 'package:loginpagefirebase/uihelper/widget.dart';

class phoneauth extends StatefulWidget {
  @override
  State<phoneauth> createState() {
    return phonestate();
  }
}

class phonestate extends State<phoneauth> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phonenumber = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Phone Number Login"), centerTitle: true),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customTextField(
              phonenumber,
              "Enter phone number",
              Icons.phone,
              false,
            ),
            UiHelper.button(() async {
              FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException ex) {},
                codeSent: (String verificationid, int? resendtoken) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>otp(verificationid: verificationid,)));
                },
                codeAutoRetrievalTimeout: (String verificationid) {},
                phoneNumber: phonenumber.text.toString(),
              );
            }, "Get Otp"),
          ],
        ),
      ),
    );
  }
}
