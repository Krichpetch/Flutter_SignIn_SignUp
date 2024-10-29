import 'package:flutter/material.dart';
import 'screens/sign_in.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ToDoListApp());
}

class ToDoListApp extends StatefulWidget {
  const ToDoListApp({super.key});

  @override
  State<ToDoListApp> createState() => _ToDoListAppState();
}

class _ToDoListAppState extends State<ToDoListApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "To Do List Application",
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const SignInScreen());
  }
}
