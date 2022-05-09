import 'package:flutter/material.dart';

import './widgets/trip_activity_list.dart';
import './widgets/activity_list.dart';
import './widgets/trip_overview.dart';

import '../../models/activity.model.dart';
import '../../models/trip.model.dart';

import '../../datas/data.dart' as data;

class City extends StatefulWidget {
  City({Key? key}) : super(key: key);

  final List<Activity> activities = data.activities;

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  late Trip mytrip = Trip(city: 'Paris', activities: [], date: DateTime.now());
  late int index = 0;

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(
        const Duration(days: 1),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    ).then(
      (newDate) {
        if (newDate != null) {
          setState(() {
            mytrip.date = newDate;
          });
        }
      },
    );
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Organisation voyage'),
        actions: const <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TripOverview(setDate: setDate, trip: mytrip),
            Expanded(
              child: index == 0
                  ? ActivityList(activities: widget.activities)
                  : TripActivityList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Decouverte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Mes activitées',
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
