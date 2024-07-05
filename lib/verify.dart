import 'package:demo2/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verify extends StatefulWidget {
  
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  void initState() {
    super.initState();
    sendVerify();
    }
    sendVerify ()async{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification().then((value) => Get.snackbar('Link Sent', 'A Verification Link has been sent your email address',snackPosition: SnackPosition.BOTTOM));
    }
    reload ()async {
      await FirebaseAuth.instance.currentUser!.reload().then((value) => Get.offAll( const Wrapper()));
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(

        title: const Text('Verification'),
      ),
      body: const Center(
        child: Text(
          'Verification link has been sent to your emial verify that and click the reload button below'
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (()=>reload()),
      child:const Icon(Icons.replay_circle_filled_outlined) 
      ,),
    );
  }
}