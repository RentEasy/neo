import 'package:flutter/material.dart';
import 'package:neo/blocs/properties_bloc.dart';
import 'package:neo/providers/property_provider.dart';
import 'package:neo/screens/marketplace/properties/index.dart';
import 'package:provider/provider.dart';

void main() => runApp(RentEasyApp());

class RentEasyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/properties/create': (BuildContext context) => new CreatePropertyScreen(),
//    '/properties/edit': (BuildContext context) => new EditProperty(),
    '/properties/list': (BuildContext context) => new PropertyListWidget(),
    '/properties/property': (BuildContext context) => new PropertyWidget(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RentEasy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: Marketplace(),
    );
  }
}

class Marketplace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PropertiesBLoC>(
      create: (_) => PropertiesBLoC(
        propertyProvider: PropertyProvider(),
      ),
      dispose: (_, bloc) => bloc.dispose(),
      child: PropertyListScreen(),
    );
  }
}
