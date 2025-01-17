import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:increament/Country/country_model.dart';
import 'package:http/http.dart' as http;

class CountryProvider extends ChangeNotifier {
  CountryProvider() {
    pickfun();
  }
  bool isloader = false;

  CountryModel countryobject = CountryModel();

  pickfun() async {
    isloader = true;
    notifyListeners();
    var response = await http.get(
        Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images'));
    if (response.statusCode == 200) {
      // Corrected this line
      var tem = jsonDecode(response.body);
      countryobject = CountryModel.fromJson(tem);
      notifyListeners();
    }
    isloader = false;
  }
}
