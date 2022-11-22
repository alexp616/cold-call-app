import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cold Call App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(170, 57, 57, 57)
      ),
      home: const MyHomePage(title: 'Cold Call App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Student student = Student("Shake your phone!", "images/first_image.jpg");

  @override
  void initState() {
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        selectStudent();
      }
    );
  }

  void selectStudent() {
    setState(() {
          student = Student.studentList[Random().nextInt(Student.studentList.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 41, 41),
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            color: Color.fromARGB(255, 41, 41, 41),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    selectStudent();
                  },
                  child: Image.asset(student.imageUrl, height: 500, width: 500),
                ),
                Text(student.name, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold), )
              ],
            )
          ),
        )
      )
    );  
  }
}

class Student {
  String name;
  String imageUrl;

  Student(this.name, this.imageUrl);

  static List<Student> studentList = [
    Student("Alex Pan", "images/alex_pan.jpg"),
    Student("Benjamin Chong", "images/benjamin_chong.jpg"),
    Student("Demetri Gavalas", "images/demetri_gavalas.jpg"),
    Student("Matthew Kadaev", "images/matthew_kadaev.jpg"),
    Student("Ravnoor Bedi", "images/ravnoor_bedi.jpg"),
    Student("Shaun Karani", "images/shaun_karani.jpg"),
    Student("Wolfie Jethwani-Keyser", "images/wolfie_jethwani_keyser.jpg"),
    Student("Xingqiu Liu", "images/xingqiu_liu.jpg")
  ];
}