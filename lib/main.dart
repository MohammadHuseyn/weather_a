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
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: searchC,
            decoration: InputDecoration(labelText: 'City name'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: searchCity, child: Text("Search")),
          SizedBox(height: 10,),
          Text(_response == null? "" : "city: ${_response!.name}")
        ],
      ),
    );
  }

  Future<void> searchCity() async {
    final response = await _dataService.getWeather(searchC.text);
    setState(() => _response = response);
  }
}
