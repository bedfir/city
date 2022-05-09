import 'package:flutter/material.dart';
import 'package:material/models/activity.model.dart';
import 'package:material/datas/data.dart' as data;
import 'package:material/models/trip.model.dart';
import 'package:material/views/city/widgets/activity_card.dart';

class City extends StatefulWidget {
  City({Key? key}) : super(key: key);

  final List<Activity> activities = data.activities;

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  Trip mytrip = Trip(city: 'Paris', activities: [], date: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Paris'),
        actions: const <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Choisissez une date'),
                      ElevatedButton(
                        child: Text('Selectioner une date'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                crossAxisCount: 2,
                children: widget.activities
                    .map(
                      (activity) => ActivityCard(
                        activity: activity,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
