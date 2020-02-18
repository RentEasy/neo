import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Property extends Equatable {
  final int id;
  final String address;
  final Color color;
  final int price = 42;

  Property(this.id, this.address)
      : color = Colors.primaries[id % Colors.primaries.length];

  Property.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        id = json['id'],
        color = json['color'];

  Map<String, dynamic> toJson() => {'address': address, 'id': id};

  @override
  String toString() {
    return "$id: $address";
  }

  @override
  List<Object> get props => [id, address];
}
