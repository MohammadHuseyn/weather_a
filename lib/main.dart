import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_a/models.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather A',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _dataService = DataService();
  WeatherResponse? _response;
  var searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.1),
        child: Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueAccent),
                child: IconButton(
                  iconSize: 20,
                  icon: Icon(Icons.person_sharp,color: Colors.black54),
                  onPressed: null,
                ),
              ),
              Spacer(),
              Text('Weather A',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueAccent
                ),
                child: IconButton(
                  iconSize: 20,
                  icon: Icon(Icons.search,color: Colors.black54,),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Future<void> searchCity() async {
    final response = await _dataService.getWeather(searchC.text);
    setState(() => _response = response);
  }
}
