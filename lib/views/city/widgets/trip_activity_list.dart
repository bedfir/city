import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;

  const TripActivityList({Key? key, required this.activities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var activity = activities[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(activity.image),
            ),
            title: Text(activity.name),
            subtitle: Text(activity.city),
            trailing: Icon(Icons.delete),
          ),
        );
      },
      itemCount: activities.length,
    );
  }
}
