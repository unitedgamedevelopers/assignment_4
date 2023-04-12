import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherAPI extends StatefulWidget {
  @override
  _WeatherAPIState createState() => _WeatherAPIState();
}

class _WeatherAPIState extends State<WeatherAPI> {
  Map<String, dynamic> weatherData = {};

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    String apiKey = 'a4e44cc70e22419781dca5d4c2fe05d1';
    String cityName = 'Toronto';
    String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          weatherData = {
            'temperature': (jsonData['main']['temp'] - 273.15).toStringAsFixed(2),
            'city': jsonData['name'],
            'description': jsonData['weather'][0]['description'],
            'icon': jsonData['weather'][0]['icon'],
          };
        });
      } else {
        print('Failed to fetch weather data. Error ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to fetch weather data. Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (weatherData.isNotEmpty)
              Column(
                children: [
                  Image.network(
                    'https://openweathermap.org/img/w/${weatherData['icon']}.png', // Icon URL based on weather condition
                    scale: 1.5,
                  ),
                  Text(
                    'Temperature: ${weatherData['temperature']}°C',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'City: ${weatherData['city']}',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Weather: ${weatherData['description']}',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              )
            else
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

