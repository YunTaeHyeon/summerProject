import 'package:flutter/material.dart';
import 'package:summerproject/speech_recorder.dart';
import 'package:summerproject/api_service.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextDemo extends StatefulWidget {
  const SpeechToTextDemo({super.key});

  @override
  _SpeechToTextDemoState createState() => _SpeechToTextDemoState();
}

class _SpeechToTextDemoState extends State<SpeechToTextDemo> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '버튼을 누르고 스피킹을 시작하세요!';
  final SpeechRecorder _recorder = SpeechRecorder();
  Map<String, dynamic> _responseData = {};

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _recorder.initializeRecorder();
  }

  void _startListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _sendFile() async {
    String filePath = _recorder.filePath;
    if (filePath.isEmpty) {
      print("File does not exist");
      return;
    }

    var responseData = await ApiService.sendFile(filePath);
    setState(() {
      _responseData = responseData;
    });
  }

  @override
  Widget build(BuildContext context) {
    String text = _responseData['text'] ?? 'N/A';
    int quota = _responseData['quota'] ?? 0;
    int assessmentScore = _responseData['assessment_score'] ?? 0;
    String assessmentDetails = _responseData['assessment_details'] ?? 'N/A';
    List<dynamic> refGraph = _responseData['ref_graph'] ?? [];
    List<dynamic> usrGraph = _responseData['usr_graph'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech to Text'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_text),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _recorder.isRecording
                    ? _recorder.stopRecording
                    : _recorder.startRecording,
                child: Text(_recorder.isRecording
                    ? 'Stop Recording'
                    : 'Start Recording'),
              ),
              ElevatedButton(
                onPressed: _startListening,
                child:
                    Text(_isListening ? 'Stop Listening' : 'Start Listening'),
              ),
              ElevatedButton(
                onPressed: _sendFile,
                child: const Text('Send File'),
              ),
              const SizedBox(height: 20),
              const Text('응답 데이터:'),
              Text('Text: $text'),
              Text('Quota: $quota'),
              Text('Assessment Score: $assessmentScore'),
              Text('Assessment Details: $assessmentDetails'),
              Text('Ref Graph: ${refGraph.toString()}'),
              Text('Usr Graph: ${usrGraph.toString()}'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _recorder.dispose();
    super.dispose();
  }
}
