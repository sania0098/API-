// import 'package:flutter/material.dart';
// import 'package:increament/gemini/gemeni_provider.dart';
// import 'package:provider/provider.dart';

// class GeminiHomeScreen extends StatelessWidget {
//   final TextEditingController _textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => GemeniProvider(),
//       child: Consumer<GemeniProvider>(
//         builder: (context, model, child) => Scaffold(
//           backgroundColor: Colors.black,
//           body: SafeArea(
//             child: Stack(
//               children: [
//                 // Gradient Background
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFF4A148C), Color(0xFF000000)],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Header
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Text(
//                             "Gemini",
//                             style: TextStyle(
//                               fontSize: 32,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),

//                         Expanded(
//                           child: ListView.builder(
//                             padding: EdgeInsets.symmetric(horizontal: 16.0),
//                             itemCount: model.textList.length,
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // User Question
//                                   Container(
//                                     margin: EdgeInsets.only(top: 8.0),
//                                     padding: EdgeInsets.all(12.0),
//                                     decoration: BoxDecoration(
//                                       color:
//                                           Colors.purpleAccent.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Text(
//                                       model.textList[index],
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),

//                         // TextField with Controller
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Row(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: Colors.white.withOpacity(0.1),
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(
//                                     color: Colors.white.withOpacity(0.5),
//                                     width: 1.5,
//                                   ),
//                                 ),
//                                 child: TextField(
//                                   controller: _textController,
//                                   style: TextStyle(color: Colors.white),
//                                   cursorColor: Colors.purpleAccent,
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: 16.0, horizontal: 16.0),
//                                     hintText: "Enter your query...",
//                                     hintStyle: TextStyle(
//                                       color: Colors.white.withOpacity(0.5),
//                                     ),
//                                     border: InputBorder.none,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         SizedBox(height: 20),

//                         // Button to handle TextField input
//                         ElevatedButton(
//                           onPressed: () {
//                             model.call_api(_textController.text);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.purpleAccent,
//                             padding: EdgeInsets.symmetric(
//                               vertical: 12,
//                               horizontal: 32,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           child: Text(
//                             "Submit",
//                             style: TextStyle(fontSize: 16, color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gemeni_provider.dart';

class GeminiHomeScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GemeniProvider(),
      child: Consumer<GemeniProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                // Gradient Background
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4A148C), Color(0xFF000000)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Gemini",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: model.textList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 8.0),
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.purpleAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              model.textList[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _textController,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.purpleAccent,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                hintText: "Enter your query...",
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_textController.text.trim().isNotEmpty) {
                                  model.call_api(_textController.text.trim());
                                  _textController.clear();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purpleAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
