import 'package:flutter/material.dart';
import 'screens/marketplace/properties/index.dart';

class Router {
  final routes = <String, WidgetBuilder>{
    '/properties/create': (BuildContext context) => new CreateProperty(),
    '/properties/list': (BuildContext context) => new PropertiesListing(),
    '/properties/property': (BuildContext context) => new PropertyListing(),
  };

  Router() {
    new MaterialApp(
      title: 'RentEasy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: new PropertiesListing(),
    );
  }
}
