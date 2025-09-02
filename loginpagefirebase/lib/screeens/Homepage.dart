import 'package:flutter/material.dart';
import 'package:loginpagefirebase/uihelper/widget.dart';
import 'package:loginpagefirebase/screeens/signin.dart';

class Homepage extends StatelessWidget{
   Homepage({super.key});
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(appBar: AppBar(
      
      title: Text('Login Page',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
      ),
      centerTitle:true,
      backgroundColor: Colors.orangeAccent,
      
      
      
    ),
    body:
    

    
    
     
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          
        
          UiHelper.customTextField(emailcontroller,'Enter Email',Icons.email,false),
          UiHelper.customTextField(passwordcontroller, "Enter Password", Icons.password, true),
          UiHelper.button((){}, 'Login'),

          SizedBox(height: 20,width: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have a account ?',style: TextStyle(
                fontSize: 20
              ),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Signin())
                );
              }, child: Text("Sign in",
              style: TextStyle(
                fontSize: 19,
                color: Colors.indigoAccent

              ),
              ))
            ],
          )
          
        ],
        
           ),
           
     
      );
    
  }

}