
import 'package:demo2/forgot.dart';
import 'package:demo2/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  signIn ()async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextField(
            controller: email ,
            decoration: const InputDecoration(
              hintText: 'Enter Email Here'
            ),
        
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: const InputDecoration(
              
              hintText: 'Enter Password here'
            ),
        
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
        
          Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(10)
            ),
          
            child: ElevatedButton(onPressed: (()=>signIn()), child: const  Text('Login',style: TextStyle(color: Colors.black),)
            ),
            
          ),
          const SizedBox(height: 15,),
           ElevatedButton(onPressed: (()=>Get.to(const Signup())),
          child: const  Text('Register Now',style: TextStyle(color: Colors.black),)
          ),
           ElevatedButton(onPressed: (()=>Get.to(const Forgot()))
           , child:const  Text('Forgot Password',style: TextStyle(color: Colors.black),)
          )
        
          
        ],),
      ),
      
    );
  }
}