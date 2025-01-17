import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:increament/Country/country_provider.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountryProvider(),
      child: Consumer<CountryProvider>(
        builder: (context, model, child) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('this is data ${model.countryobject.data?[0].name}'),
                // SizedBox(
                //   height: 0,
                // ),
                // model.countryobject.data?[0].flag == null
                //     ? CircularProgressIndicator()
                //     : SvgPicture.network(
                //         model.countryobject.data![0].flag!,
                //         height: 100,
                //         width: 100,
                //       ),
                Text('Country names and flag'),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(' ${model.countryobject.data?[index].name}'),
                            Container(
                              height: 100,
                              width: 100,
                              child: SvgPicture.network(
                                model.countryobject.data![index].flag!,
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
