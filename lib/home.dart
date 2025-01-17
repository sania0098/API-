import 'package:flutter/material.dart';
import 'package:increament/home_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, model, value) => Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: 100,
                height: 50,
                color: Colors.amber,
                child: Center(child: Text('${model.number}')),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      model.increase();
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      model.decrease();
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  model.reset();
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.amber,
                  child: Center(child: Text('reset')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
