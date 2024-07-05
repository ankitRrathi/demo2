// ignore_for_file: unused_element

import 'package:demo2/homepage.dart';
import 'package:demo2/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  
   const Wrapper({super.key});
   

  @override
  State<Wrapper> createState() => _HomepageState();
}

class _HomepageState extends State<Wrapper> {
  final user =FirebaseAuth.instance.currentUser;
   
  @override
  Widget build(BuildContext context) {
    signout () async {
      await FirebaseAuth.instance.signOut();

    }
    return   Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context,snapshot){
          if(snapshot.hasData)
          {
            return  const HomePage();

          }
          else{
            return  const Login();

          }
        }
        )
    );
  }
}




