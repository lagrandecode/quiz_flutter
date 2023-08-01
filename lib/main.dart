
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/screens/quiz/components/quiz_screen.dart';
import 'package:quiz_flutter/screens/quiz/components/select_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);




  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (_)=>SelectScreen()));
            }, child: Text("move", style: TextStyle(fontSize: 30),),
          ),
        ),
      ),
    );
  }
}

 


