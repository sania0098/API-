import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:increament/gemini/gemini_model.dart';

class GemeniProvider extends ChangeNotifier {
  GemeniProvider() {}
  List<String> textList = [];
  GeminiModel geminiobject = GeminiModel();
  call_api(text) async {
    print('this is call api $text');
    textList.add(text);
    notifyListeners();
    String api =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyAhCjYgiMvspUJxpx07AhIHhhOhdo57Pwc';
    dynamic header = {"Content-Type": "application/json"};
    dynamic body = {
      "contents": [
        {
          "parts": [
            {"text": "$text"}
          ]
        }
      ]
    };

    var respos = await http.post(
        headers: header, body: jsonEncode(body), Uri.parse(api));
    if (respos.statusCode == 200) {
      var maxdata = jsonDecode(respos.body);
      geminiobject = GeminiModel.fromJson(maxdata);
      notifyListeners();
      print(
          'this is original answer ${geminiobject.candidates?[0].content?.parts?[0].text}');
      textList.add("${geminiobject.candidates?[0].content?.parts?[0].text}");
      notifyListeners();
    }
  }
}
