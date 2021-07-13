import 'package:flutter/material.dart';
import 'package:flutter_sinusoidals/flutter_sinusoidals.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class TextToSpeech extends StatefulWidget {
  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController controller = TextEditingController();
  bool _isSpeaking = true;
  List _colors = [
    Colors.indigo.shade300,
    Colors.indigo,
    Colors.indigo.shade900
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
            )),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueGrey, width: 2)),
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  maxLines: 10,
                  controller: controller,
                  decoration: InputDecoration(
                    
                      hintStyle: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      border: InputBorder.none,
                      hintText: 'Paste text.....'),
                )),
          ),
          Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  color: Colors.indigo.shade700,
                  borderRadius: BorderRadius.circular(70)),
              child: IconButton(
                onPressed: () async {
                  await flutterTts.speak(controller.text.trim().toString());
                  flutterTts.setStartHandler(() {
                    setState(() {
                      print("playing");
                      _isSpeaking = false;
                    });
                  });
                  flutterTts.setCompletionHandler(() {
                    setState(() {
                      print("Complete");
                      _isSpeaking = true;
                    });
                  });
                },
                icon: Icon(
                  Icons.volume_up,
                  color: Colors.white,
                  size: 35,
                ),
              )),
          SoundWave()            
        ]));
  }





  Widget SoundWave() {
    if(_isSpeaking==true){
      print('false');
      return Container();
    }if(_isSpeaking==false) {
      print('true'); 
     return Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
        children: [Sinusoidals(
                        itemCount: 3,
                        builder: (context, index) {
                          return SinusoidalItem(
                            model: SinusoidalModel(
                              formular: WaveFormular.travelling,
                              amplitude: 15,
                              waves: 5,
                              translate: 5.0 * (index + 1),
                              center: 5.0 * (index + 1),
                            ),
                            child: Container(
                              height: 75,
                              color: _colors[index],
                            ),
                          );
                        },
                      ),                      
          Transform.rotate(
            angle: 3.1415,
                      child: Sinusoidals(
                        itemCount: 3,
                        builder: (context, index) {
                          return SinusoidalItem(
                            model: SinusoidalModel(
                              formular: WaveFormular.travelling,
                              amplitude: 15,
                              waves: 5,
                              translate: 5.0 * (index + 1),
                              center: 5.0 * (index + 1),
                            ),
                            child: Container(
                              height: 75,
                              color: _colors[index],
                            ),
                          );
                        },
                      ),
          )],
      ),
      );
    }
  }
}
