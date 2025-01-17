// // // import 'package:flutter/material.dart';
// // // import 'package:increament/weather/weather_provider.dart';
// // // import 'package:provider/provider.dart';

// // // class WeatherScreen extends StatefulWidget {
// // //   const WeatherScreen({super.key});

// // //   @override
// // //   State<WeatherScreen> createState() => _WeatherScreenState();
// // // }

// // // class _WeatherScreenState extends State<WeatherScreen> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ChangeNotifierProvider(
// // //         create: (context) => WeatherProvider(),
// // //         child: Consumer<WeatherProvider>(
// // //             builder: (context, model, child) => Scaffold(
// // //                   body: Center(
// // //                     child: model.isloading
// // //                         ? CircularProgressIndicator()
// // //                         : Column(
// // //                             mainAxisAlignment: MainAxisAlignment.center,
// // //                             children: [
// // //                               SizedBox(
// // //                                 height: 100,
// // //                               ),
// // //                               GestureDetector(
// // //                                   onTap: () {
// // //                                     model.pickfun('karachi');
// // //                                   },
// // //                                   child: Text('Weather Data')),
// // //                               const SizedBox(height: 20),
// // //                               Text('${model.weatherobject.location?.country}'),
// // //                               const SizedBox(height: 10),
// // //                               Text('${model.weatherobject.location?.name}'),
// // //                               const SizedBox(height: 10),
// // //                               Text(
// // //                                   '${model.weatherobject.current?.temperature} c'),
// // //                               Image.network(
// // //                                   '${model.weatherobject.current?.weatherIcons?[0]}')
// // //                             ],
// // //                           ),
// // //                   ),
// // //                 )));
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:increament/weather/weather_provider.dart';
// // import 'package:provider/provider.dart';

// // class WeatherScreen extends StatefulWidget {
// //   const WeatherScreen({super.key});

// //   @override
// //   State<WeatherScreen> createState() => _WeatherScreenState();
// // }

// // class _WeatherScreenState extends State<WeatherScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //         create: (context) => WeatherProvider(),
// //         child: Consumer<WeatherProvider>(
// //             builder: (context, model, child) => Scaffold(
// //                   appBar: AppBar(
// //                     title: const Text('Weather App'),
// //                   ),
// //                   body: Center(
// //                     child: model.isloading
// //                         ? CircularProgressIndicator()
// //                         : Column(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               // Dropdown for city selection
// //                               DropdownButton<String>(
// //                                 value: model.selectedCity,
// //                                 items: model.cities
// //                                     .map((city) => DropdownMenuItem(
// //                                           value: city,
// //                                           child: Text(city),
// //                                         ))
// //                                     .toList(),
// //                                 onChanged: (value) {
// //                                   if (value != null) {
// //                                     model.updateCity(value);
// //                                   }
// //                                 },
// //                               ),
// //                               const SizedBox(height: 20),
// //                               Text(
// //                                 'Country: ${model.weatherobject.location?.country}',
// //                               ),
// //                               const SizedBox(height: 10),
// //                               Text(
// //                                 'City: ${model.weatherobject.location?.name}',
// //                               ),
// //                               const SizedBox(height: 10),
// //                               Text(
// //                                 'Temperature: ${model.weatherobject.current?.temperature} °C',
// //                               ),
// //                               if (model.weatherobject.current?.weatherIcons !=
// //                                   null)
// //                                 Image.network(
// //                                   model.weatherobject.current!.weatherIcons![0],
// //                                   height: 100,
// //                                   width: 100,
// //                                 ),
// //                             ],
// //                           ),
// //                   ),
// //                 )));
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:increament/weather/weather_provider.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    // List of cities to display in the dropdown
    final List<String> cities = [
      'Peshawar',
      'Islamabad',
      'Karachi',
      'Lahore',
      'India',
      'Tokyo',
      'Shanghai',
      'São Paulo',
      "New York City, USA",
      "Los Angeles, USA",
      "Chicago, USA",
      "Toronto, Canada",
      "Vancouver, Canada",
      "Mexico City, Mexico",
      "Miami, USA",
      "Houston, USA",
      "São Paulo, Brazil",
      "Rio de Janeiro, Brazil",
      "Buenos Aires, Argentina",
      "Bogotá, Colombia",
      "Lima, Peru",
      "Santiago, Chile",
      "London, UK",
      "Paris, France",
      "Berlin, Germany",
      "Madrid, Spain",
      "Rome, Italy",
      "Amsterdam, Netherlands",
      "Moscow, Russia",
      "Istanbul, Turkey",
      "Cairo, Egypt",
      "Johannesburg, South Africa",
      "Lagos, Nigeria",
      "Nairobi, Kenya",
      "Casablanca, Morocco",
      "Addis Ababa, Ethiopia",
      "Sydney, Australia",
      "Melbourne, Australia",
      "Auckland, New Zealand",
      "Brisbane, Australia",
      "Perth, Australia",
      "Dubai, UAE",
      "Riyadh, Saudi Arabia",
      "Tel Aviv, Israel",
      "Doha, Qatar",
      "Abu Dhabi, UAE",
    ];

    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: Consumer<WeatherProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Weather App'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<String>(
                  value: model.selectedCity,
                  dropdownColor: Colors.white,
                  underline: const SizedBox(), // Removes the underline
                  icon: const Icon(
                    Icons.location_city,
                    color: Colors.amber,
                  ),
                  items: cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      model.getWeatherData(
                          value); // Fetch weather for the selected city
                    }
                  },
                ),
              ),
            ],
          ),

          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: model.isloading
                  ? const CircularProgressIndicator()
                  : model.weatherobject.location != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20), // Spacing from top
                            // Add an image at the top of the body
                            Image.asset(
                              'asset/cloud_pic.jpg', // Replace with your asset path
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '${model.weatherobject.location?.name}',
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${model.weatherobject.location?.country}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '${model.weatherobject.current?.temperature}°C',
                              style: const TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (model.weatherobject.current?.weatherIcons !=
                                null)
                              Image.network(
                                '${model.weatherobject.current?.weatherIcons?[0]}',
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            const SizedBox(height: 20),
                            Text(
                              '${model.weatherobject.location?.localtime}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        )
                      : const Text(
                          'No weather data available.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
            ),
          ),

          //  Container(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Colors.blue, Colors.lightBlueAccent],
          //       begin: Alignment.topCenter,
          //       end: Alignment.bottomCenter,
          //     ),
          //   ),
          //   child: Center(
          //     child: model.isloading
          //         ? const CircularProgressIndicator()
          //         : model.weatherobject.location != null
          //             ? Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     '${model.weatherobject.location?.name}',
          //                     style: const TextStyle(
          //                       fontSize: 28,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.white,
          //                     ),
          //                   ),
          //                   const SizedBox(height: 10),
          //                   Text(
          //                     '${model.weatherobject.location?.country}',
          //                     style: const TextStyle(
          //                       fontSize: 20,
          //                       color: Colors.white70,
          //                     ),
          //                   ),
          //                   const SizedBox(height: 20),
          //                   Text(
          //                     '${model.weatherobject.current?.temperature}°C',
          //                     style: const TextStyle(
          //                       fontSize: 64,
          //                       fontWeight: FontWeight.w300,
          //                       color: Colors.white,
          //                     ),
          //                   ),
          //                   const SizedBox(height: 20),
          //                   if (model.weatherobject.current?.weatherIcons !=
          //                       null)
          //                     Image.network(
          //                       '${model.weatherobject.current?.weatherIcons?[0]}',
          //                       height: 100,
          //                       fit: BoxFit.cover,
          //                     ),
          //                   const SizedBox(height: 20),
          //                   Text(
          //                     '${model.weatherobject.location?.localtime}',
          //                     style: const TextStyle(
          //                       fontSize: 16,
          //                       color: Colors.white70,
          //                     ),
          //                   ),
          //                 ],
          //               )
          //             : const Text(
          //                 'No weather data available.',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 18,
          //                 ),
          //               ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
