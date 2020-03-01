import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:neo/data/graphql.dart';
import 'package:neo/model/app_state.dart';
import 'package:neo/redux/actions.dart';
import 'package:neo/redux/store.dart';
import 'package:neo/screens/marketplace/properties/index.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() async {
  final store = await createReduxStore();

  runApp(GraphQLProvider(
    client: graphQLConfiguration.client,
    child: CacheProvider(child: RentEasyApp(store)),
  ));
}

class RentEasyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  final Store<AppState> store;

  final routes = <String, WidgetBuilder>{
    '/properties/create': (BuildContext context) => new CreateProperty(),
//    '/properties/edit': (BuildContext context) => new EditProperty(),
    '/properties/list': (BuildContext context) => new PropertyList(),
    '/properties/property': (BuildContext context) => new PropertyListing(),
  };

  RentEasyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'RentEasy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
        home: StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(FetchAllPropertiesAction()),
            builder: (context, store) =>
                Marketplace(store, analytics, observer)),
      ),
    );
  }
}

class Marketplace extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  final DevToolsStore<AppState> store;

  Marketplace(this.store, this.analytics, this.observer);

  @override
  Widget build(BuildContext context) {
    return PropertyList();
  }
}

// class RentEasyApp extends StatelessWidget {
//   final routes = <String, WidgetBuilder>{
//     '/properties/create': (BuildContext context) => new CreateProperty(),
//     '/properties/list': (BuildContext context) => new PropertiesListing(),
//     '/properties/property': (BuildContext context) => new PropertyListing(),
//   };

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<PropertyModel>(
//           create: (context) => PropertyModel(),
//           // update: (context, properties) => PropertyModel(),
//         ),
//       ],
//       child: new MaterialApp(
//         title: 'RentEasy',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         routes: routes,
//         home: new PropertiesListing(),
//       ),
//     );
//   }
// }
