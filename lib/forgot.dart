
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final TextEditingController email = TextEditingController();
  forgot ()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForGot Password'),
        centerTitle: true,
      ),
      body:  Padding(
        padding:  const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text('Reset Your Password',style: TextStyle(fontSize: 20,color: Colors.red,fontStyle: FontStyle.italic),
            ),
             TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Enter your Email ',
                prefixIcon: Icon(Icons.email_outlined)
                
              ),
            ),
            const SizedBox(
              height: 20,
            ),
              ElevatedButton(
              style:const  ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                elevation: WidgetStatePropertyAll(5),
              ),
              
              onPressed: (()=>forgot()),
            child: const Text('Sent Reset Link',style: TextStyle(color: Colors.white),)
            ),
            const SizedBox(
              height: 15,
            ),
           const  FloatingActionButton(onPressed: null,
            child: Icon(Icons.arrow_back_ios),
            )
          ],
        ),
      ),
    );
  }
}