import 'package:equatable/equatable.dart';
import 'package:neo/model/property.dart';

class AppState extends Equatable {
  final List<Property> properties;

  AppState(this.properties);

  AppState.fromJson(Map<String, dynamic> json)
      : properties = (json['properties'] as List)
            ?.map((i) => new Property.fromJson(i as Map<String, dynamic>))
            ?.toList();

  factory AppState.empty() => AppState(new List());

  Map<String, dynamic> toJson() => {'properties': properties};

  @override
  String toString() => "$properties";

  @override
  List<Object> get props => [properties];
}
