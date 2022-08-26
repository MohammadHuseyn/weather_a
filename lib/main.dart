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

  Future<void> asyncFunc () async {
    final response = await _dataService.getWeather("Mashhad");
    setState(() => _response = response);
  }

  @override
  void initState(){
    super.initState();
    asyncFunc();
  }

  @override
  Widget build(BuildContext context) {
    Widget image = Container();
    if (_response != null){
      String src = "";
      switch (_response!.weather.icon) {
        case "01d": src = "sunny";break;
        case "01n": src = "moonlight";break;
        case "02d": src = "sunny_cloudy";break;
        case "02n": src = "cloudy_moonlight";break;
        case "03d":case "03n": src = "cloudy";break;
        case "04d":case "04n": src = "cloudy_windy";break;
        case "09d":case "09n": src = "shower_rain";break;
        case "10d": src = "rain_sunny";break;
        case "10n": src = "rain_moonlight";break;
        case "11d":case "11n": src = "flash";break;
        case "13d":case "13n": src = "snow";break;
        case "50d":case "50n": src = "mist";break;
      }
      src += ".png";
      image = Image.asset(src,scale: 2.5,);
    }
    return Scaffold(
      backgroundColor: Colors.indigo[800],
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.1),
        child: Container(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.indigoAccent),
                child: const IconButton(
                  iconSize: 20,
                  icon: Icon(Icons.refresh, color: Colors.black),
                  onPressed: null,
                ),
              ),
              const Spacer(),
              const Text(
                'Weather A',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.indigoAccent),
                child: IconButton(
                  iconSize: 20,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: (){
                    showDialog(context: context, builder: (_) => AlertDialog(
                      title: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              autofocus: true,
                              controller: searchC,
                              decoration: InputDecoration.collapsed(hintText: "Enter a city name"),
                            ),
                          ),
                          IconButton(onPressed: (){searchCity();Navigator.pop(context);}, icon: Icon(Icons.search_rounded))
                        ],
                      ),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: _response == null?
          Center(child: Text("You haven't select any city, use search button",
          style: TextStyle(color: Colors.white,fontSize: 20),),) :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.indigoAccent,
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.all(20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(
                              color: Colors.white
                          ),
                          children: [
                            TextSpan(text: "${_response!.name} ",style: TextStyle(fontSize: 25)),
                            TextSpan(text: "${_response!.main.temp!.toStringAsFixed(1)}° C",style: TextStyle(fontSize: 20)),
                            TextSpan(text: "\n\n${_response!.weather.description}"),
                            TextSpan(text: "\n\n${_response!.wind.speed!.toStringAsFixed(1)} m/s"),
                            TextSpan(text: "wind speed \n\n${_response!.wind.deg}"),
                            TextSpan(text: "\n\nfeels like ${_response!.main.feels_like!.toStringAsFixed(1)}° C",style: TextStyle(fontSize: 20))
                          ]
                      ),
                    )
                ),
                const Spacer(),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      image,
                      // Icon(Icons.wb_cloudy_outlined,size: 100,),
                      Text("Cloudy")
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> searchCity() async {
    final response = await _dataService.getWeather(searchC.text);
    setState(() => _response = response);
  }
}
