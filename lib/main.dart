import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
              child: Text(
            "Launchpad",
            style: GoogleFonts.belleza(color: Colors.red, fontSize: 25),
          )),
        ),
        body: Wrap(
          spacing: 5,
          runSpacing: 5,
          children:  [
            Pad(Color(0xffADCBFC), Color(0xff067CCB), "1.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "2.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "3.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "4.mp3"),
            Pad(Color(0xffADCBFC), Color(0xff067CCB), "5.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "6.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "7.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "8.mp3"),
            Pad(Color(0xffADCBFC), Color(0xff067CCB), "9.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "10.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "10.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "11.mp3"),
            Pad(Color(0xffADCBFC), Color(0xff067CCB), "13.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "14.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "15.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "16.mp3"),
            Pad(Color(0xffADCBFC), Color(0xff067CCB), "17.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), ".18mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "18.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "19.mp3"),
            Pad(Color(0xffADCBFC), Color(0xff067CCB), "21.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "22.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "23.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "24.mp3"),
            Pad(Color(0xffADCBFC), Color(0xff067CCB), "25.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "26.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "27.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "28.mp3"),

          ],
        ),
      ),
    );
  }
}

class Pad extends StatefulWidget {
  late Color outile_color;
  late Color center_Color;
  String sound;
  Pad(this.outile_color, this.center_Color, this.sound);

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  @override
  Widget build(BuildContext context) {
    Color _outlineColor = widget.outile_color;
    Color _centerColor = widget.center_Color;
    double height= MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;

    final player = AudioPlayer();
    return GestureDetector(
      onTap: () async {
        setState(() {
          _outlineColor = Colors.white;
          _centerColor = Colors.white;
          player.play(AssetSource(widget.sound));
        });
        await Future.delayed(Duration(milliseconds: 300));
        setState(() {
          _outlineColor = widget.outile_color;
          _centerColor = widget.center_Color;
        });
      },
      child: Container(height: height/8, width: width/4.2,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [_outlineColor,_centerColor],
                radius: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5),),
            boxShadow: [BoxShadow(color: Colors.pink,blurRadius: 0.5)]
        ),
      ),
    );
  }
}
