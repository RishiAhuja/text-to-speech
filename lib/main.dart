import 'package:flutter/material.dart';
import 'package:flutter_project/components/text_to_speech.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                 child: Align(
                  alignment: Alignment.topLeft,
                   child: Text(
                    'Text to Speech',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade900
                      ),
                    )
                    ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [  
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => TextToSpeech())
                      );
                    },
                     child: Material(
                      elevation: 7,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        height: MediaQuery.of(context).size.height/3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade600,
                              Colors.blue.shade400
                            ]
                          )
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.text_fields,
                                  color: Colors.white,
                                  size: 65,
                                ),
                                Text(
                                  'Text to Speech',
                                  style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              )
                              ]
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                    elevation: 7,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      height: MediaQuery.of(context).size.height/3.5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [                            
                            Colors.red.shade600,
                            Colors.redAccent.shade200,
                          ]
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(                      
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.mic_outlined,
                                color: Colors.white,
                                size: 65,
                              ),
                          Text(
                            'Speech to Text',
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              )
                            ]
                          )
                        ],
                      ),
                    ),
                  ),
                ]
              )
            ],
          )
        ],
      ),
    );
  }
}