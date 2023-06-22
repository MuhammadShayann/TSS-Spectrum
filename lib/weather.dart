import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherForecastPage extends StatefulWidget {
  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  String cityName = 'London';
  String apiKey = 'YOUR_API_KEY'; // Replace with your own API key

  Future<Map<String, dynamic>> getWeatherData() async {
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
    http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  void updateWeatherData(String city) {
    setState(() {
      cityName = city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weather Forecast for $cityName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: getWeatherData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Map<String, dynamic> data = snapshot.data;
                  double temperature = data['main']['temp'];
                  int humidity = data['main']['humidity'];

                  return Column(
                    children: [
                      Text(
                        'Temperature: ${temperature.toStringAsFixed(1)}°C',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Humidity: $humidity%',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Failed to fetch weather data');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter city name',
              ),
              onChanged: (value) {
                updateWeatherData(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
