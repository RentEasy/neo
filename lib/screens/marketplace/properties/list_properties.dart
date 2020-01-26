// import 'package:flutter/material.dart';

// import 'single_property.dart';
// import '../../../models/property.dart';

// class PropertiesListing extends StatefulWidget {
//   final title = "Your Properties";

//   @override
//   _PropertiesListingState createState() => _PropertiesListingState();
// }

// class _PropertiesList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var itemNameStyle = Theme.of(context).textTheme.title;
//     var properties = Provider.of<PropertyModel>(context);

//     return ListView.builder(
//       itemCount: properties.items.length,
//       itemBuilder: (context, index) => ListTile(
//         leading: Icon(Icons.done),
//         title: Text(
//           properties.items[index].address,
//           style: itemNameStyle,
//         ),
//       ),
//     );
//   }
// }

// class _PropertiesListingState extends State<PropertiesListing> {
//   void _createProperty() {
//     Navigator.pushNamed(context, '/properties/create');
//   }

//   @override
//   Widget build(BuildContext context) {
//     var itemNameStyle = Theme.of(context).textTheme.title;
//     var properties = Provider.of<PropertyModel>(context);

//     Widget propertiesListView = ListView.builder(
//       itemCount: properties.items.length,
//       itemBuilder: (BuildContext context, int index) {
//         var property = properties.items[index];
//         return InkWell(
//           onTap: () => {
//             Navigator.pushNamed(
//               context,
//               '/properties/property',
//               arguments: PropertyArguments(
//                 property.address,
//               ),
//             ),
//           },
//           child: Container(
//             padding: EdgeInsets.only(top: 5, bottom: 5),
//             height: 70,
//             // color: Colors.amber[colorCodes[index]],
//             child: Row(
//               children: <Widget>[
//                 Image.asset(
//                   'images/ialicante-mediterranean-homes-475777-unsplash.jpg',
//                   fit: BoxFit.fitHeight,
//                 ),
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Text('${property.address}', style: itemNameStyle),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );

//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: propertiesListView,
//       floatingActionButton: FloatingActionButton(
//         onPressed: _createProperty,
//         tooltip: 'Create Property',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
