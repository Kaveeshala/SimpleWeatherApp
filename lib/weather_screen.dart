import 'dart:ui';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/secrets.dart';
//import 'package:flutter/painting.dart';
//import 'package:flutter/widgets.dart';
import 'package:weather_app/weather_forcast_item.dart';
import 'additional_info_item.dart';
import 'package:http/http.dart' as http;


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }
  Future getCurrentWeather() async{
    String cityName = 'London' ;
    final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey"
        ),
    );
    print (res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Weather App',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
         actions:  [
             IconButton(
                 onPressed: () {},
                 icon: const Icon(Icons.refresh)
             ),
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity ,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                    child: const Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300K',
                            style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                           SizedBox(height: 16),
                          Icon(
                            Icons.cloud,
                            size: 64,),
                          Text(
                            'Rain',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ),
            ),
            const SizedBox(height: 8),
            const Text('Weather Forecast',
                style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),
            const SizedBox(height: 16),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: '00.00',
                    icon: Icons.cloud,
                    temperature: '301.22',
                  ),
                  HourlyForecastItem(
                    time: '03.00',
                    icon: Icons.sunny,
                    temperature: '299.22',
                  ),
                  HourlyForecastItem(
                    time: '06.00',
                    icon: Icons.cloud,
                    temperature: '302.22',
                  ),
                  HourlyForecastItem(
                    time: '09.00',
                    icon: Icons.sunny,
                    temperature: '300.12',
                  ),
                  HourlyForecastItem(
                    time: '12.00',
                    icon: Icons.cloud,
                    temperature: '304.12',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Additional Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '91',
                ),
                AdditionalInfoItem(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '7.5',
                ),
                AdditionalInfoItem(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '1000',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}




