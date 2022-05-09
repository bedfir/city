import 'package:flutter/material.dart';
import 'package:material/views/city/city.dart';
// import 'package:material/views/home/home.dart';

void main(List<String> args) {
  runApp(const DymaTrip());
}

class DymaTrip extends StatelessWidget {
  const DymaTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      home: City(),
    );
  }
}
