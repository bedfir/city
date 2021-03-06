import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip_model.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip trip;
  final String cityName;
  final double amount;

  const TripOverview({
    Key? key,
    required this.setDate,
    required this.trip,
    required this.cityName,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width:
          orientation == Orientation.landscape ? size.width * 0.5 : size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  trip.date != null
                      ? DateFormat("d/M/y").format(trip.date as DateTime)
                      : 'Choisissez une Date',
                  style: const TextStyle(
                    fontSize: 14.5,
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Selectioner une date'),
                onPressed: setDate,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              const Expanded(
                child: Text(
                  'Montant / personne',
                  style: TextStyle(
                    fontSize: 14.5,
                  ),
                ),
              ),
              Text(
                '$amount ???',
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
