

import 'package:demo2/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  register ()async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: pass.text);
    Get.offAll( const Wrapper());
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar : AppBar(
        title: const Text('SignUp'),

      ),
      body:  Padding(
        padding: const  EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
            controller: name,
              decoration: const InputDecoration(
                hintText: 'Enter Name'
              ),
            ),
             TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Enter Email'
              ),
            ),
             TextField(
              controller: pass,
              obscureText: true,
              decoration:const  InputDecoration(
                hintText: 'Enter Password'
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.amber)
              ),
              onPressed: (()=>register()), child:const  Text('Register'))
          ],
        ),
      ),

    );
  }
}