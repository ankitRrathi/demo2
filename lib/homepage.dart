import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    signOut()async{
      await FirebaseAuth.instance.signOut();
    }
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Homepage'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('${user!.email}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=>signOut()),
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}