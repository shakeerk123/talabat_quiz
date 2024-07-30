import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void addQuestionsToFirestore() async {
  final questions = [
    {
      'kidQuestion': 'What is your favorite lunch meal?',
      'parentQuestion': 'What is your kid\'s favorite lunch meal?',
      'options': ['Pizza', 'Burger', 'Sandwich', 'Salad'],
    },
    {
      'kidQuestion': 'What is your favorite subject?',
      'parentQuestion': 'What is your kid\'s favorite subject?',
      'options': ['Math', 'Science', 'English', 'History', 'Art'],
    },
    {
      'kidQuestion': 'What is your favorite drink to have with lunch?',
      'parentQuestion': 'What is your kid\'s favorite drink to have with lunch?',
      'options': ['Water', 'Juice', 'Milk', 'Soda', 'Tea', 'Lemonade'],
    },
    {
      'kidQuestion': 'What is your favorite school activity?',
      'parentQuestion': 'What is your kid\'s favorite school activity?',
      'options': ['Sports', 'Reading', 'Art', 'Music', 'Drama', 'Dance', 'Coding'],
    },
    {
      'kidQuestion': 'What is your favorite school supply?',
      'parentQuestion': 'What is your kid\'s favorite school supply?',
      'options': ['Pencil', 'Notebook', 'Eraser', 'Crayons', 'Markers', 'Glue', 'Ruler', 'Scissors'],
    },
    {
      'kidQuestion': 'What is your favorite thing to do at recess?',
      'parentQuestion': 'What is your kid\'s favorite thing to do at recess?',
      'options': ['Play tag', 'Swing', 'Slide', 'Play ball', 'Hopscotch', 'Jump rope', 'Hide and seek', 'Climb', 'Skip rope'],
    },
    {
      'kidQuestion': 'What is your favorite fruit to have in your lunch?',
      'parentQuestion': 'What is your kid\'s favorite fruit to have in their lunch?',
      'options': ['Apple', 'Banana', 'Orange', 'Grapes', 'Pineapple', 'Strawberry', 'Blueberry', 'Watermelon', 'Peach', 'Pear'],
    },
    
  ];

  DocumentReference sessionRef = FirebaseFirestore.instance.collection('sessions').doc('currentSession');

  await sessionRef.update({
    'questions': FieldValue.arrayUnion(questions),
  });

  print('Questions added to Firestore');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  addQuestionsToFirestore(); // Add questions to Firestore
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firestore Example'),
      ),
      body: const Center(
        child: Text('Questions have been added to Firestore!'),
      ),
    );
  }
}


