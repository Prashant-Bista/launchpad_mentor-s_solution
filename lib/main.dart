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
      title: 'Launchpad',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Launchpad",
            style: GoogleFonts.pirataOne(
              color: Colors.red
            )
            ),
            backgroundColor:  Colors.black,
          ),
          backgroundColor: Colors.black,
          body: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [Pad(Color(0xffADCBFC), Color(0xff067CCB), "1.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "2.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "3.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "4.mp3"),
              Pad(Color(0xffADCBFC), Color(0xff067CCB), "5.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "6.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "7.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "8.mp3"),
              Pad(Color(0xffADCBFC), Color(0xff067CCB), "9.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "10.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "11.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "12.mp3"),
              Pad(Color(0xffADCBFC), Color(0xff067CCB), "13.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "14.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "15.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "16.mp3"),
              Pad(Color(0xffADCBFC), Color(0xff067CCB), "17.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "18.mp3"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "19.mp3"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "20.wav"),
              Pad(Color(0xffADCBFC), Color(0xff067CCB), "21.mp3"),Pad(Color(0xffff2525), Color(0xffc40050), "22.wav"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "23.wav"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "24.wav"),
              Pad(Color(0xffADCBFC), Color(0xff067CCB), "25.wav"),Pad(Color(0xffff2525), Color(0xffc40050), "26.wav"),Pad(Color(0xffADCBFC), Color(0xff067CCB), "27.wav"),Pad(Color(0xffe247FC), Color(0xffA23AB7), "28.wav")],
          ),
        
        ),
      )
    );
  }
}
class  Pad extends StatefulWidget {
  final CenterColor;
  final Outlinecolor;
  final sound;
  const Pad (this.CenterColor,this.Outlinecolor,this.sound);

  @override
  State<Pad> createState() => _State();
}

class _State extends State<Pad> {
  late Color _centerColor;
  late Color _outlineColor;
  final Player = AudioPlayer();
  @override
  void initState() {
    _centerColor= widget.CenterColor;
    _outlineColor =widget.Outlinecolor;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ()async{
        setState(() {
          _centerColor=Colors.white;
          _outlineColor=Colors.white;
          Player.play(AssetSource(widget.sound));
        }
            );
        await Future.delayed(Duration(milliseconds: 200));

        setState(() {
          _centerColor=widget.CenterColor;
          _outlineColor=widget.Outlinecolor;
        });
      },
      child: Container(
        height: height/8.5,
        width:width/4.3,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [_centerColor,_outlineColor],
            radius: 0.5
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [BoxShadow(color: Colors.pink,blurRadius: 3)]
        ),
      ),
    );
  }
}

