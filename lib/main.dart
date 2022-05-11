import 'package:flutter/material.dart';
import 'package:material/views/city/city_view.dart';
import 'package:material/views/home/home_view.dart';

void main(List<String> args) {
  runApp(const DymaTrip());
}

class DymaTrip extends StatelessWidget {
  const DymaTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 25,
          ),
        ),
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      // home: CityView(),
    );
  }
}
