// import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpagefirebase/screeens/finalpage.dart';
import 'package:loginpagefirebase/uihelper/widget.dart';

class otp extends StatefulWidget {
  String verificationid;
  otp({super.key, required this.verificationid});
  @override
  State<otp> createState() {
    return otpstate();
  }
}

class otpstate extends State<otp> {
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP")),
      body: Column(
        children: [
          UiHelper.customTextField(otp, "Enter otp", Icons.numbers, true),
          UiHelper.button(() async {
            try {
              PhoneAuthCredential credential =
                  await PhoneAuthProvider.credential(
                    verificationId: widget.verificationid,
                    smsCode: otp.text.toString(),
                  );
                  FirebaseAuth.instance.signInWithCredential(credential).then((Value){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>finalpage()));
                  });

            } catch (ex) {
              UiHelper.customalertbox(context, ex.toString());
            }
          }, "Verify"),
        ],
      ),
    );
  }
}
