import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:app_the_weather_flutter/models/CurrentWeather.dart';
import 'package:app_the_weather_flutter/models/FutureWeatherThreeHour.dart';
import 'package:app_the_weather_flutter/services/remote_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'FutureWeather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String? _passwordError;
  String _nameCity = 'HaNoi';
  var isLoaded = false;
  CurrentWeather? currentWeather;
  FutureWeatherThreeHour? futureWeatherThreeHour;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    currentWeather = await RemoteService().getCurrentWeather('HaNoi');
    futureWeatherThreeHour =
        await RemoteService().getFutureWeatherThreeHour('HaNoi');
    if (currentWeather != null || futureWeatherThreeHour != null) {
      setState(() {});
    }
  }

  searchWeatherWithCity(String nameCity) async {
    currentWeather = await RemoteService().getCurrentWeather(nameCity);
    futureWeatherThreeHour =
        await RemoteService().getFutureWeatherThreeHour(nameCity);
    if (currentWeather != null || futureWeatherThreeHour != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Weather"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xFF304FFE),
              Color(0xFF3D5AFE),
              Color(0xFF536DFE),
              Color(0xFF8C9EFF),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: "Name City",
                      errorText: _passwordError,
                      labelStyle:
                          const TextStyle(fontSize: 20, color: Colors.black),
                      border: const OutlineInputBorder(),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      )),
                  obscureText: false,
                  onSubmitted: (text) {
                    setState(() {
                      _nameCity = _controller.text;
                      searchWeatherWithCity(_controller.text);
                    });
                    _controller.clear();
                  },
                  textInputAction: TextInputAction.send,
                ),
                const SizedBox(height: 20),
                Center(
                    child: Text(
                  _nameCity,
                  style: const TextStyle(fontSize: 34, color: Colors.white),
                )),
                const SizedBox(height: 20),
                Center(
                  child: Text(currentWeather?.weather[0].description ?? "",
                      style:
                          const TextStyle(fontSize: 24, color: Colors.white)),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(("${currentWeather?.main.temp.toString()}°C"),
                      style:
                          const TextStyle(fontSize: 86, color: Colors.white)),
                ),
                Center(
                  child: SizedBox(
                      height: 160,
                      width: 160,
                      child: Image(
                          image: NetworkImage(
                              "http://openweathermap.org/img/wn/${currentWeather?.weather[0].icon}@2x.png"),
                          fit: BoxFit.fill)),
                ),
                Row(
                  children: [
                    const SizedBox(width: 25),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.indigo[900],
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/ic_humidity.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "${currentWeather?.main.humidity.toString()}%",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 55),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.indigo[900],
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/ic_wind.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "${currentWeather?.wind.speed.toString()}km/h",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 55),
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.indigo[900],
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/ic_pressure.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "${currentWeather?.main.pressure.toString()} mb",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'Today',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  FutureWeather(futureWeatherThreeHour: futureWeatherThreeHour,)),
                        );
                      },
                      child: Row(
                        children: const [
                          Text(
                            'Next 5 days',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 28,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[100],
                        ),
                        child: SizedBox(
                          height: 100,
                          width: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                getHourToDateFormat(futureWeatherThreeHour
                                    ?.listWeather?[0].dtTxt),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://openweathermap.org/img/wn/${futureWeatherThreeHour?.listWeather?[0].weather?[0].icon ?? '10d'}@2x.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                '${futureWeatherThreeHour?.listWeather?[0].main?.temp ?? '27'}°',
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[100],
                        ),
                        child: SizedBox(
                          height: 100,
                          width: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                getHourToDateFormat(futureWeatherThreeHour
                                    ?.listWeather?[1].dtTxt),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://openweathermap.org/img/wn/${futureWeatherThreeHour?.listWeather?[1].weather?[0].icon ?? '10d'}@2x.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                '${futureWeatherThreeHour?.listWeather?[1].main?.temp ?? '27'}°',
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[100],
                        ),
                        child: SizedBox(
                          height: 100,
                          width: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                getHourToDateFormat(futureWeatherThreeHour
                                    ?.listWeather?[2].dtTxt),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://openweathermap.org/img/wn/${futureWeatherThreeHour?.listWeather?[2].weather?[0].icon ?? '10d'}@2x.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                '${futureWeatherThreeHour?.listWeather?[2].main?.temp ?? '27'}°',
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue[100],
                        ),
                        child: SizedBox(
                          height: 100,
                          width: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                getHourToDateFormat(futureWeatherThreeHour
                                    ?.listWeather?[3].dtTxt),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://openweathermap.org/img/wn/${futureWeatherThreeHour?.listWeather?[3].weather?[0].icon ?? "10d"}@2x.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                '${futureWeatherThreeHour?.listWeather?[3].main?.temp ?? '27'}°',
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo[900],
                        ),
                        child: SizedBox(
                          height: 100,
                          width: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                getHourToDateFormat(futureWeatherThreeHour
                                    ?.listWeather?[4].dtTxt),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://openweathermap.org/img/wn/${futureWeatherThreeHour?.listWeather?[4].weather?[0].icon ?? "10d"}@2x.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                '${futureWeatherThreeHour?.listWeather?[4].main?.temp ?? '27'}°',
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo[900],
                        ),
                        child: SizedBox(
                          height: 100,
                          width: 60,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                getHourToDateFormat(futureWeatherThreeHour
                                    ?.listWeather?[5].dtTxt),
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://openweathermap.org/img/wn/${futureWeatherThreeHour?.listWeather?[5].weather?[0].icon ?? "10d"}@2x.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                '${futureWeatherThreeHour?.listWeather?[5].main?.temp ?? '27'}°',
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getHourToDateFormat(dynamic timer) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(timer);
    var outputFormat = DateFormat('HH:mm');
    var outputTimer = outputFormat.format(inputDate);
    return outputTimer;
  }

  setBackGroundColor(dynamic timer) {
    if (futureWeatherThreeHour != null) {
      var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      var inputDate = inputFormat.parse(timer);
      var outputFormat = DateFormat('HH');
      var outputTimer = outputFormat.format(inputDate);
      if (outputTimer != '03' && outputTimer != '00' && outputTimer != '21') {
        return Colors.blue[100];
      } else {
        return Colors.indigo[900];
      }
    }
  }
}


