import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'StoryBody.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'StoryView.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    CollectionReference diary = FirebaseFirestore.instance.collection('Diary');
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Story()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Diary',
          style: GoogleFonts.mPlusRounded1c(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Meri Duniya',
              style: GoogleFonts.mPlusRounded1c(fontSize: 100),
            ),
          ),
          Expanded(
            child: LottieBuilder.network(
                'https://assets2.lottiefiles.com/packages/lf20_8jyg6s9f.json'),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .4,
            child: Center(
              child: StreamBuilder(
                stream: diary.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Expanded(
                          child: LottieBuilder.network(
                              'https://assets3.lottiefiles.com/packages/lf20_mniampqn.json'),
                        ),
                      ),
                    );
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((Diary) {
                      return Center(
                          child: InkWell(
                        onTap: () {
                          HeadingT = Diary['Heading'];
                          BodyT = Diary['Body'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoryView()),
                          );
                        },
                        onLongPress: () {
                          Diary.reference.delete();
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Center(
                                  child: Text(
                                Diary['Heading'],
                                style: GoogleFonts.mPlusRounded1c(fontSize: 20),
                              )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff293241)),
                            ),
                          ),
                        ),
                      ));
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// ListTile(
//                     title: Text(Diary['Heading']),
//                     onTap: () {
//                       HeadingT = Diary['Heading'];
//                       BodyT = Diary['Body'];
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => StoryView()),
//                       );
//                     },
//                     onLongPress: () {
//                       Diary.reference.delete();
//                     },
//                   ),


// Center(
          //   child: Text(
          //     'Welcome',
          //     style: GoogleFonts.mPlusRounded1c(fontSize: 100),
          //   ),
          // ),
          // Container(
          //   height: 300,
          //   width: double.infinity,
          //   child: Expanded(
          //     child: LottieBuilder.network(
          //         'https://assets2.lottiefiles.com/packages/lf20_8jyg6s9f.json'),
          //   ),
          // ),