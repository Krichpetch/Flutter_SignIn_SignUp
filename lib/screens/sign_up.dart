import 'package:flutter/material.dart';
import 'package:todolist_app/screens/sign_in.dart';
import '../constants/constant.dart';
import '../components/my_textformfield.dart';
import '../components/my_button.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  void _showDialog(String txtMsg, {VoidCallback? onPressed}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: themePrimary,
          title: Text(
            'Sign Up',
            style: textTitlePrimary,
          ),
          content: Text(
            txtMsg,
            style: textSubTitle,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'cancel'); // Close the dialog
                if (onPressed != null) {
                  onPressed();
                }
              },
              child: Text(
                'OK',
                style: textMenu,
              ),
            ),
          ],
        );
      },
    );
  }

  void signUpUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Show success dialog and navigate to another page
      _showDialog('Account created successfully!', onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showDialog('Passwords require at least 6 characters.');
      } else if (e.code == 'email-already-in-use') {
        _showDialog('The account already exists for that email.');
      } else {
        _showDialog('An unknown error occurred.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: themePrimary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Form(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                    child: Column(
                      children: [
                        Text(
                          "Welcome to our community",
                          style: textTitlePrimary,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "To get started, please provide your information and create an account.",
                          textAlign: TextAlign.center,
                          style: textSubTitle,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MyTextFormField(
                            controller: nameController,
                            obscureText: false,
                            labelText: 'Name',
                            hintText: 'Please Enter your name'),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                            controller: emailController,
                            obscureText: false,
                            labelText: 'Email',
                            hintText: 'Please Enter your email'),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                            controller: passwordController,
                            obscureText: false,
                            labelText: 'Password',
                            hintText: 'Please Enter your password'),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                            controller: rePasswordController,
                            obscureText: false,
                            labelText: 'Confirm Password',
                            hintText: 'Please confirm your password'),
                        const SizedBox(
                          height: 30,
                        ),
                        MyButton(
                          onTap: signUpUser,
                          hintText: "Sign Up",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Already have an account?',
                              style: textSubTitle,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInScreen()));
                                },
                                child: Text(
                                  'Sign In',
                                  style: textHighlightBold,
                                )),
                          ],
                        ),
                      ],
                    ))),
          ),
        ));
  }
}
