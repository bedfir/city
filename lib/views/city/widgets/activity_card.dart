import 'package:flutter/material.dart';
import '../../../models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(activity.image);
  }
}
