import 'package:assignment_4/calculator_page.dart';
import 'package:assignment_4/weather_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment_4',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'HomePage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Title for the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/gif/orchestrate.gif', // Displays a GIF image
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16), // Adds a space of height 16 pixels
            Text(
              'Assignment 4', // Text with font size 24 and bold fontWeight
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // Adds a space of height 16 pixels
            Text(
              'Welcome to our App developed using Flutter', // Text with font size 18
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // Adds a space of height 16 pixels
            Text(
              'Developed by:', // Text with font size 18
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8), // Adds a space of height 8 pixels
            Text(
              '1. Krushil Narola', // Text with font size 18
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              '2. Kuldeep Kaur', // Text with font size 18
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorPage()), // Navigates to CalculatorPage when the button is pressed
                );
              },
              icon: Icon(Icons.calculate), // Calculator icon
              label: Text('Calculator'), // Text on the button
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherAPI()), // Navigates to WeatherAPI page when the button is pressed
                );
              },
              icon: Icon(Icons.cloud), // Weather icon
              label: Text('Weather API'), // Text on the button
            ),
          ],
        ),
      ),
    );
  }
}
