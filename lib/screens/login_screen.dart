import 'package:flutter/material.dart';
import 'package:lets_meet/resources/auth_methods.dart';
import 'package:lets_meet/widgets/custom_btn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final AuthMethods authMethods =  AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const Text(
          "Start or join a  meeting",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 20,),
        //Padding(padding: EdgeInsets.symmetric(vertical: 30)),
        Image.asset('assets/images/login_page_image.jpg'),
        const SizedBox(height: 30,),
         CustomButton( text: 'Login', onPressed: () async{ 
           bool res= await authMethods.signInWithGoogle(context);
          if(res){//if auth is succesful then go to homescreen
          Navigator.pushNamed(context, '/home');
          }
         },)
      ],
    ));
  }
}
