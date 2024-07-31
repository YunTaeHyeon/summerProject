import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ApiService {
  static const String _apiKey = '9acdeb8c7b514fb3bbc0ddf9303dd139';
  static const String _url =
      'https://clovaspeech-gw.ncloud.com/recog/v1/stt?lang=Eng&assessment=true&utterance=true&graph=true';

  static Future<Map<String, dynamic>> sendFile(String filePath) async {
    try {
      var fileBytes = await File(filePath).readAsBytes();

      var request = http.Request(
        'POST',
        Uri.parse(_url),
      );

      request.headers['Content-Type'] = 'application/octet-stream';
      request.headers['X-CLOVASPEECH-API-KEY'] = _apiKey;
      request.bodyBytes = fileBytes;

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('File uploaded successfully');
        return json.decode(response.body);
      } else {
        print('File upload failed with status: ${response.statusCode}');
        print(response.body);
        return {};
      }
    } catch (e) {
      print("Error sending file: $e");
      return {};
    }
  }
}
