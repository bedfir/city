import 'package:flutter/material.dart';
import 'package:material/views/404/not_found.dart';
import 'package:material/views/city/city_view.dart';
import 'package:material/views/home/home_view.dart';

import 'models/city_model.dart';

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
      // home: HomeView(),
      // initialRoute: '/city',
      routes: {
        '/': (context) {
          return HomeView();
        },
      },
      onGenerateRoute: (settings) {
        if (settings.name == CityView.routeName) {
          final City city = settings.arguments as City;
          return MaterialPageRoute(builder: (context) {
            return CityView(city: city);
          });
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return NotFound();
        });
      },
      // home: CityView(),
    );
  }
}
