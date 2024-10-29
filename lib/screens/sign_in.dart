import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/constant.dart';

import '../components/my_textformfield.dart';
import '../components/my_button.dart';
import '../components/my_icon_button.dart';

import '../screens/sign_up.dart';
import '../screens/home_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

 void _showDialog(String txtMsg, {VoidCallback? onPressed}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: themePrimary,
        title: Text(
          'Sign In',
          style: textTitlePrimary,
        ),
        content: Text(
          txtMsg,
          style: textSubTitle,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'cancel'); 
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

  void signInUser() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    
    // Show success dialog and navigate to another page
    _showDialog('Login successfully.', onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()), 
      );
    });
    
  } on FirebaseAuthException catch (e) {
    print('Failed with error code: ${e.code}');
    print(e.message);
    if (e.code == 'invalid-email') {
      _showDialog('Please enter a valid email (ending with @•••.com)');
    } else if (e.code == 'wrong-password') {
      _showDialog('Wrong email or password.');
    } else {
      _showDialog('An unknown error occurred.');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: themePrimary,
        body: SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 80.0),
            child: Form(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
              child: Column(
                children: [
                  const SizedBox(height: 45,),
                  Text(
                    "Hello,ready to get started?",
                    style: textTitlePrimary,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Please Sign into your account",
                    style: textSubTitle,
                  ),
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
                      obscureText: true,
                      labelText: 'Password',
                      hintText: 'Please Enter your password'),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Forgot Password?',
                          style: textHighlight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    onTap: signInUser,
                    hintText: "Sign In",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.8,
                          color: highlightTertiary,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text('Or continue with', style: textHighlight),
                      const SizedBox(
                        width: 8,
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.8,
                          color: highlightTertiary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    myIconButton(icon: 'assets/images/Google_Icon.png'),
                    SizedBox(width: 25),
                    myIconButton(icon: 'assets/images/facebook-color-icon.png'),
                  ]),
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
                        'Not a member?',
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
                                    builder: (context) => const SignUpScreen()));
                          },
                          child: Text(
                            'Register now.',
                            style: textHighlightBold,
                          )),
                    ],
                  ),
                ],
              ),
            )),
          ),
        ));
  }
}
