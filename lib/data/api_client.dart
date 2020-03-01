import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:neo/data/operations/queries.dart';
import 'package:neo/data/property_provider.dart';
import 'package:neo/main.dart';
import 'package:neo/model/property.dart';

class ApiClient {
  Future<List<Property>> fetchProperties() async {
    PropertyProvider pp = PropertyProvider();

    return pp.getProperties();
  }
}
