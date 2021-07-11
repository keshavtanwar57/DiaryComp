import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';
import 'package:lottie/lottie.dart';
import 'HomeNotes.dart';

TextEditingController key_controller = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Text('Diary', style: GoogleFonts.mPlusRounded1c(fontSize: 80)),
            Expanded(
              child: LottieBuilder.network(
                  'https://assets1.lottiefiles.com/private_files/lf30_lgesk2nm.json'),
            ),
            Center(
              child: Container(
                  width: 200,
                  child: Expanded(
                    child: TextField(
                      style: GoogleFonts.mPlusRounded1c(fontSize: 30),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      controller: key_controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: "Enter Key",
                          hintStyle: GoogleFonts.mPlusRounded1c(
                              color: Colors.white70)),
                    ),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                key_controller.text == 'kdiary-'
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      )
                    : null;
                key_controller.text == 'knotes-'
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeNotes()),
                      )
                    : null;
                key_controller.clear();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: Text('Verify',
                    style: GoogleFonts.mPlusRounded1c(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
