import 'dart:async';
import 'dart:ffi';

import 'package:app_the_weather_flutter/models/FutureWeatherThreeHour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FutureWeather extends StatefulWidget {
  const FutureWeather({super.key, required this.futureWeatherThreeHour});

  final FutureWeatherThreeHour? futureWeatherThreeHour;

  @override
  State<StatefulWidget> createState() {
    return _FutureWeatherState();
  }
}

class _FutureWeatherState extends State<FutureWeather> {
  int position = 0;
  bool _isChooseItemOne = true;
  bool _isChooseItemTwo = false;
  bool _isChooseItemThree = false;
  bool _isChooseItemFor = false;
  bool _isChooseItemFive = false;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<ListWeather>? mListWeather12h =
        getListWeather12h(widget.futureWeatherThreeHour?.listWeather);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureWeather'),
      ),
      body: Container(
        color: Colors.indigo[200],
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 28,
                      ),
                      InkWell(
                        onTap: (){setClickItemWeather(0);},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: setBackGroundItem(_isChooseItemOne),
                          ),
                          child: SizedBox(
                            height: 120,
                            width: 70,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://openweathermap.org/img/wn/${mListWeather12h?[0].weather?[0].icon ?? '10d'}@2x.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${mListWeather12h?[0].main?.temp}°",
                                  style: TextStyle(
                                      fontSize: 20, color: setTextColorItem(_isChooseItemOne)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  getRankToDateFormat(
                                      mListWeather12h?[0].dtTxt ?? ''),
                                  style: TextStyle(
                                      fontSize: 18, color: setTextColorItem(_isChooseItemOne)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: (){setClickItemWeather(1);},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: setBackGroundItem(_isChooseItemTwo),
                          ),
                          child: SizedBox(
                            height: 120,
                            width: 70,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://openweathermap.org/img/wn/${mListWeather12h?[1].weather?[0].icon ?? '10d'}@2x.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${mListWeather12h?[1].main?.temp}°",
                                  style: TextStyle(
                                      fontSize: 20, color: setTextColorItem(_isChooseItemTwo)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  getRankToDateFormat(
                                      mListWeather12h?[1].dtTxt ?? ''),
                                  style: TextStyle(
                                      fontSize: 18, color: setTextColorItem(_isChooseItemTwo)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: (){setClickItemWeather(2);},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: setBackGroundItem(_isChooseItemThree),
                          ),
                          child: SizedBox(
                            height: 120,
                            width: 70,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://openweathermap.org/img/wn/${mListWeather12h?[2].weather?[0].icon ?? '10d'}@2x.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${mListWeather12h?[2].main?.temp}°",
                                  style: TextStyle(
                                      fontSize: 20, color: setTextColorItem(_isChooseItemThree)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  getRankToDateFormat(
                                      mListWeather12h?[2].dtTxt ?? ''),
                                  style: TextStyle(
                                      fontSize: 18, color: setTextColorItem(_isChooseItemThree)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: (){setClickItemWeather(3);},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: setBackGroundItem(_isChooseItemFor),
                          ),
                          child: SizedBox(
                            height: 120,
                            width: 70,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://openweathermap.org/img/wn/${mListWeather12h?[3].weather?[0].icon ?? '10d'}@2x.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${mListWeather12h?[3].main?.temp}°",
                                  style: TextStyle(
                                      fontSize: 20, color: setTextColorItem(_isChooseItemFor)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  getRankToDateFormat(
                                      mListWeather12h?[3].dtTxt ?? ''),
                                  style: TextStyle(
                                      fontSize: 18, color: setTextColorItem(_isChooseItemFor)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        onTap: (){setClickItemWeather(4);},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: setBackGroundItem(_isChooseItemFive),
                          ),
                          child: SizedBox(
                            height: 120,
                            width: 70,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "http://openweathermap.org/img/wn/${mListWeather12h?[4].weather?[0].icon ?? '10d'}@2x.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${mListWeather12h?[4].main?.temp}°",
                                  style: TextStyle(
                                      fontSize: 20, color: setTextColorItem(_isChooseItemFive)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  getRankToDateFormat(
                                      mListWeather12h?[4].dtTxt ?? ''),
                                  style: TextStyle(
                                      fontSize: 18, color: setTextColorItem(_isChooseItemFive)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 350,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
              ),
            ),
            Positioned(
              bottom: 130,
              left: 55,
              child: Stack(
                children: [
                  Container(
                    height: 320,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.indigo[300],
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "http://openweathermap.org/img/wn/${mListWeather12h?[setMaxPosition(position)].weather?[0].icon ?? '10d'}@2x.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          "${mListWeather12h?[setMaxPosition(position)].weather?[0].description}",
                          style:
                              const TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Today",
                          style:
                          TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 40,
                    child: Column(
                      children: [
                        Text(
                          "${mListWeather12h?[setMaxPosition(position)].main?.temp}°",
                          style: const TextStyle(
                              fontSize: 52, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Feels like ${mListWeather12h?[setMaxPosition(position)].main?.feelsLike}°",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 80,
                          width: 80,
                          child: Image(
                            image: AssetImage('assets/ic_feel_like.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    child: Row(
                      children: [
                        const SizedBox(width: 25),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage('assets/ic_humidity.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "${mListWeather12h?[setMaxPosition(position)].main?.humidity}%",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage('assets/ic_wind.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "${mListWeather12h?[setMaxPosition(position)].wind?.speed} km/h",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image: AssetImage('assets/ic_pressure.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "${mListWeather12h?[setMaxPosition(position)].main?.pressure} mb",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 55,
              child: Container(
                height: 80,
                width: size.width - 110,
                decoration: BoxDecoration(
                  color: Colors.indigo[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            Positioned(
              bottom: -25,
              child: Row(children: [
                Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://openweathermap.org/img/wn/${mListWeather12h?[setMaxPosition(position + 1)].weather?[0].icon ?? '10d'}@2x.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "${mListWeather12h?[setMaxPosition(position + 1)].weather?[0].description}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text(
                      "${mListWeather12h?[setMaxPosition(position + 1)].main?.temp}°C, ${getRankToDateFormat(mListWeather12h?[setMaxPosition(position + 1)].dtTxt ?? '')}",
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${mListWeather12h?[setMaxPosition(position + 1)].main?.tempMin}°C/${mListWeather12h?[setMaxPosition(position + 1)].main?.tempMax}°C",
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ]),
            ),
            Positioned(
                bottom: 40,
                right: 65,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      setState(() {
                       if(position >=4){
                         position = 0;
                       }else{
                         position++;
                       }
                       setClickItemWeather(position);
                      });
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.navigate_next, color: Colors.black),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  getDayToDateFormat(dynamic timer) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(timer);
    var outputFormat = DateFormat('dd');
    var day = outputFormat.format(inputDate);
    return day;
  }

  getRankToDateFormat(dynamic timer) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(timer);
    var outputFormat = DateFormat('E');
    var rank = outputFormat.format(inputDate);
    return rank;
  }

  getWeather12HInDay(dynamic timer) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var inputDate = inputFormat.parse(timer);
    var outputFormat = DateFormat('HH');
    var rank = outputFormat.format(inputDate);
    return rank;
  }

  getListWeather12h(List<ListWeather>? mListWeather) {
    return mListWeather
        ?.where((element) => getWeather12HInDay(element.dtTxt) == '12')
        .toList();
  }

  setMaxPosition(int num) {
    if (num > 4) {
      num = 0;
    }
    return num;
  }
  setClickItemWeather(int i) {
    setState(() {
        position = i;
        if(i == 0){
          _isChooseItemOne = !_isChooseItemOne;
          _isChooseItemTwo = false;
          _isChooseItemThree = false;
          _isChooseItemFor = false;
          _isChooseItemFive = false;

        }else if(i == 1){
          _isChooseItemTwo = !_isChooseItemTwo;
          _isChooseItemOne = false;
          _isChooseItemThree = false;
          _isChooseItemFor = false;
          _isChooseItemFive = false;
        }else if(i == 2){
          _isChooseItemThree = !_isChooseItemThree;
          _isChooseItemOne = false;
          _isChooseItemTwo = false;
          _isChooseItemFor = false;
          _isChooseItemFive = false;
        }else if(i == 3){
          _isChooseItemFor = !_isChooseItemFor;
          _isChooseItemOne = false;
          _isChooseItemThree = false;
          _isChooseItemTwo = false;
          _isChooseItemFive = false;
        }else if(i == 4){
          _isChooseItemFive = !_isChooseItemFive;
          _isChooseItemOne = false;
          _isChooseItemThree = false;
          _isChooseItemFor = false;
          _isChooseItemTwo = false;
        }
    });
  }

 setBackGroundItem(bool isChoose) {
    if(isChoose){
      return Colors.indigo[900];
    }else{
      return Colors.blue[100];
    }
  }
  setTextColorItem(bool isChoose) {
    if(isChoose){
      return Colors.white;
    }else{
      return Colors.indigo[900];
    }
  }
}


