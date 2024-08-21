import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/forgot.dart';
import 'package:flutter_firebase/signup.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  }
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: 'Enter the email', 
              ),
            ),
        
            TextField(
              controller: password,
              decoration: const InputDecoration(
                hintText: 'Enter the password', 
              ),
            ),

            ElevatedButton(onPressed: (() => signIn()), child: const Text('Login')),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (() => Get.to(const Signup())), child: const Text('Register now')),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (() =>Get.to(const Forgot())), child: const Text('Forgot Password')),
          ],
        ),
      ),
    );
  }
}