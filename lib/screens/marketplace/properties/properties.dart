import 'package:flutter/material.dart';
import 'property.dart';

class PropertiesListing extends StatefulWidget {
  final title = "Your Properties";

  @override
  _PropertiesListingState createState() => _PropertiesListingState();
}

class _PropertiesListingState extends State<PropertiesListing> {
  void _createProperty() {
    Navigator.pushNamed(context, '/properties/create');
  }

  final List<String> properties = <String>[
    '1234 Fake St',
    '4321 Main St',
    '1441 West St'
  ];

  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    Widget propertiesListView = ListView.builder(
      itemCount: properties.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => {
            Navigator.pushNamed(
              context,
              '/properties/property',
              arguments: PropertyArguments(
                properties[index],
              ),
            ),
          }, // handle your onTap here
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            height: 70,
            // color: Colors.amber[colorCodes[index]],
            child: Row(
              children: <Widget>[
                Image.asset(
                  'images/ialicante-mediterranean-homes-475777-unsplash.jpg',
                  fit: BoxFit.fitHeight,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('${properties[index]}'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: propertiesListView,
      floatingActionButton: FloatingActionButton(
        onPressed: _createProperty,
        tooltip: 'Create Property',
        child: Icon(Icons.add),
      ),
    );
  }
}
