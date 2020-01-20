import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class Property {
  final int id;
  final String address;
  final Color color;
  final int price = 42;

  Property(this.id, this.address)
      // To make the sample app look nicer, each item is given one of the
      // Material Design primary colors.
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Property && other.id == id;
}

class PropertyModel extends ChangeNotifier {
  final List<Property> _properties = [
    Property(0, "3478 Beechwood Blvd"),
    Property(0, "4321 Main St"),
    Property(0, "1441 West St"),
  ];

  // PropertyModel.empty() : _properties = [];

  List<Property> get items => _properties;

  void add(Property property) {
    _properties.add(property);
    notifyListeners();
  }
}
