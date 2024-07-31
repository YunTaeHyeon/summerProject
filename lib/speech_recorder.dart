import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class SpeechRecorder {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;
  late String _filePath;

  Future<void> initializeRecorder() async {
    await Permission.microphone.request();
    await _recorder.openRecorder();
  }

  Future<void> startRecording() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      _filePath = '${tempDir.path}/speech.wav';
      await _recorder.startRecorder(
        toFile: _filePath,
        codec: Codec.pcm16WAV,
      );
      _isRecording = true;
    } catch (e) {
      print("Error starting recorder: $e");
    }
  }

  Future<void> stopRecording() async {
    try {
      await _recorder.stopRecorder();
      _isRecording = false;
    } catch (e) {
      print("Error stopping recorder: $e");
    }
  }

  void dispose() {
    _recorder.closeRecorder();
  }

  bool get isRecording => _isRecording;
  String get filePath => _filePath;
}
