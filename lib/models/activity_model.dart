/// A class with four properties, one named constructors.
///
/// This class take four requeired parameters, that describe the [Activity].
///
/// {@tool snippet}
/// This next exemple show the properties
///
/// ```dart
/// String name;
/// String image;
/// String id;
/// String city;
/// double price;
/// ```
/// {@end-tool}

class Activity {
  String name;
  String image;
  String id;
  String city;
  double price;
  Activity({
    required this.name,
    required this.city,
    required this.id,
    required this.image,
    required this.price,
  });
}
