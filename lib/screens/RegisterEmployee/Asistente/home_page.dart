import 'package:flutter/material.dart';
import 'package:jobservice_ia/config/theme/app_theme.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';

import 'package:flutter_tts/flutter_tts.dart';

import '../../JobService/utils/const.dart';


DialogflowGrpcV2Beta1 dialogflow;

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  
      title: Constants.appName,
      theme: AppTheme(selectedColor: 0).theme(),
      home: const SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _textSpeech = 'Pulsa el boton \n y dile hola a nuestro asistente';

  FlutterTts flutterTts = FlutterTts();

  Future _speak(String text) async {
    await flutterTts.setLanguage("es-ES");
    await flutterTts.setPitch(1);

    await flutterTts.speak(text);
  }

  void onListen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        // ignore: avoid_print
        onStatus: (val) => print('onStatus: $val'),
        // ignore: avoid_print
        onError: (val) => print('onError: $val')
      );
      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
          onResult: (val) => setState((){
            _textSpeech = val.recognizedWords;
          })
        );
      }
    }else{
      setState(() {
        _isListening = false;
        _speech.stop();
      });
      DetectIntentResponse data = await dialogflow.detectIntent(_textSpeech, 'es-ES');
      String fulfillmentText = data.queryResult.fulfillmentText;
      if(fulfillmentText.isNotEmpty) {
          _textSpeech = fulfillmentText;
        setState(() {});
        _speak(_textSpeech);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    initPlugin();
  }
    // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {

    // Get a Service account
    final serviceAccount = ServiceAccount.fromString(
        (await rootBundle.loadString('assets/credentials.json')));
    // Create a DialogflowGrpc Instance
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Service'),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 80,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: () => onListen(),
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true, 
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 150),
          child: Text(
            _textSpeech,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}