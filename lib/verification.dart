import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/wrapper.dart';
import 'package:get/get.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override

  @override
  void initState() {
    sendVerifyLink();
    super.initState();
  }

  sendVerifyLink() async{
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) =>{
      Get.snackbar('Link Sent', 'A link has been sent to your email', margin: EdgeInsets.all(30),
      snackPosition: SnackPosition.BOTTOM)
    });
  }

  reload() async{
    await FirebaseAuth.instance.currentUser!.reload().then((value) => {Get.offAll(Wrapper())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),

      body: Center(
        child: Column(
          children: [
          const Text('Open your mail and click on the link provided to verify email & reload this page.'),
        
          ElevatedButton(onPressed: (() => reload()), child: const Icon(Icons.loop_rounded), 
          style: const ButtonStyle(alignment: Alignment.bottomLeft,
          ),),
          ]),
      ),

      );
  }
}