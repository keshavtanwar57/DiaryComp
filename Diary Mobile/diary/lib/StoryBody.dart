import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

QuillController _controller = QuillController.basic();
TextEditingController Heading_controller = TextEditingController();

String Heading = '';
String Body = '';
List Headingtitle = [];

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  CollectionReference Story = FirebaseFirestore.instance.collection('Diary');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Story.add({
            'Body': _controller.document.toPlainText(),
            'Heading': Heading_controller.text == ''
                ? 'Untitled'
                : Heading_controller.text,
          })
              .then((value) => print("Story Added"))
              .catchError((error) => print("Failed to add Story: $error"));
          Navigator.pop(context);
          Heading_controller.clear();
        },
        child: Icon(
          Icons.save_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Center(
                child: TextField(
                  controller: Heading_controller,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Add Title",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 30)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              QuillToolbar.basic(controller: _controller),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18)),
                  child: QuillEditor.basic(
                    controller: _controller,
                    readOnly: false,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
