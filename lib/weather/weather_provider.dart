// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:increament/weather/weather_model.dart';
// // import 'package:http/http.dart' as http;

// // class WeatherProvider extends ChangeNotifier {
// //   WeatherProvider() {
// //     pickfun('peshawar');
// //   }
// //   bool isloading = false;
// //   WeatherModel weatherobject = WeatherModel();

// //   pickfun(city) async {
// //     isloading = true;
// //     notifyListeners();
// //     var response = await http.get(Uri.parse(
// //         'https://api.weatherstack.com/current?access_key=9f895c010e8ba545266c63a7aa079ccc&query=$city'));
// //     if (response.statusCode == 200) {
// //       // Corrected this line
// //       var tem = jsonDecode(response.body);
// //       weatherobject = WeatherModel.fromJson(tem);
// //       notifyListeners();
// //     }
// //     isloading = false;
// //     notifyListeners();
// //   }
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:increament/weather/weather_model.dart';
// import 'package:http/http.dart' as http;

// class WeatherProvider extends ChangeNotifier {
//   WeatherProvider() {
//     pickfun(selectedCity);
//   }

//   bool isloading = false;
//   WeatherModel weatherobject = WeatherModel();
//   String selectedCity = 'Peshawar'; // Default city
//   List<String> cities = [
//     'Peshawar',
//     'Karachi',
//     'Lahore',
//     'Islamabad'
//   ]; // List of cities

//   pickfun(String city) async {
//     isloading = true;
//     notifyListeners();
//     var response = await http.get(Uri.parse(
//         'https://api.weatherstack.com/current?access_key=d96c4454cf9e99ad712b72caec5adc4f=$city'));
//     if (response.statusCode == 200) {
//       var tem = jsonDecode(response.body);
//       weatherobject = WeatherModel.fromJson(tem);
//     }
//     isloading = false;
//     notifyListeners();
//   }

//   updateCity(String city) {
//     selectedCity = city;
//     pickfun(city); // Fetch weather data for the selected city
//     notifyListeners();
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:increament/weather/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherProvider() {
    getWeatherData('Peshawar'); // Default city
  }

  WeatherModel weatherobject = WeatherModel();
  bool isloading = false;
  String selectedCity = 'Peshawar'; // Track the selected city

  Future<void> getWeatherData(String city) async {
    selectedCity = city; // Update the selected city
    isloading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(
          'https://api.weatherstack.com/current?access_key=db6594b4453311be82d80e03edfbbccd&query=$city'));

      print('API Response: ${response.body}');

      if (response.statusCode == 200) {
        var tem = jsonDecode(response.body);
        weatherobject = WeatherModel.fromJson(tem);
      } else {
        debugPrint('Error: Failed to fetch weather data.');
      }
    } catch (e) {
      debugPrint('Exception: $e');
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
