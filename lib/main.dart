import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:neo/model/app_state.dart';
import 'package:neo/redux/actions.dart';
import 'package:neo/redux/store.dart';
import 'package:neo/screens/marketplace/properties/index.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() async {
  final store = await createReduxStore();

  runApp(RentEasyApp(store));
}

class RentEasyApp extends StatelessWidget {
  final Store<AppState> store;

  final routes = <String, WidgetBuilder>{
    '/properties/create': (BuildContext context) => new CreateProperty(),
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
            builder: (context, store) => Marketplace(store)),
      ),
    );
  }
}

class Marketplace extends StatelessWidget {
  final DevToolsStore<AppState> store;

  Marketplace(this.store);

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
