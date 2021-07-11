import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Component.dart';

String HeadingT = '';
String BodyT = '';

class StoryView extends StatefulWidget {
  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  CollectionReference Story = FirebaseFirestore.instance.collection('Diary');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryViewChild(Heading: HeadingT, Body: BodyT),
    );
  }
}
