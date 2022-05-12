import 'package:flutter/material.dart';
import 'package:material/views/home/widgets/city_card.dart';
import 'package:material/widgets/ask_modal.dart';

import '../../models/city_model.dart';

class HomeView extends StatefulWidget {
  static String routeName = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  List cities = [
    City(name: 'Paris', image: 'assets/images/tourEiffel.jpg'),
    City(name: 'Rennes', image: 'assets/images/rennes.jpg'),
    City(name: 'Monastir', image: 'assets/images/monastir.jpg'),
    // City(name: 'Valladolid', image: 'assets/images/valladolid.jpg')
  ];

  openModal(context) {
    askModal(
      context,
      'Hello veux tu quelques chose',
    )!
        .then((String result) {
      print(result);
    });
  }

/*   void switchChecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('dymatrip'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map(
              (city) {
                return CityCard(city: city);
              },
            ),
            ElevatedButton(
              onPressed: () {
                openModal(context);
              },
              child: const Text('modal'),
            ),
          ],
        ),
      ),
    );
  }
}
