import 'package:equatable/equatable.dart';
import 'package:neo/screens/marketplace/properties/property_list.dart';

import '../model/property.dart';

class AddPropertyAction extends Equatable {
  final Property property;

  AddPropertyAction(this.property);

  @override
  List<Object> get props => [property];
}

class FetchAllPropertiesAction extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPropertiesAction extends Equatable {
  final OnStateChanged callback;

  FetchPropertiesAction(this.callback);

  @override
  List<Object> get props => [callback];
}

class PropertyLoadedAction extends Equatable {
  final List<Property> properties;

  PropertyLoadedAction(this.properties);

  @override
  List<Object> get props => [properties];
}
