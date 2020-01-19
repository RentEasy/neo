import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent Easy Neo Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PropertiesListing(),
    );
  }
}

class PropertiesListing extends StatefulWidget {
  final title = "Your Properties";

  @override
  _PropertiesListingState createState() => _PropertiesListingState();
}

class _PropertiesListingState extends State<PropertiesListing> {
  void _createProperty() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateProperty()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[Text("Hello world")],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createProperty,
        tooltip: 'Create Property',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CreateProperty extends StatefulWidget {
  final title = "Create Property";

  @override
  _CreatePropertyState createState() => _CreatePropertyState();
}

enum LeaseDuration { sixmonths, oneyear, twoyears }

class _CreatePropertyState extends State<CreateProperty> {
  void _createProperty() {}

  final _formKey = GlobalKey<FormState>();
  LeaseDuration _duration = LeaseDuration.oneyear;

  @override
  Widget build(BuildContext context) {
    Widget createForm = Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.home),
              hintText: '1234 Main St. Pittsburgh, PA 15217',
              labelText: 'Property Address *',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your properties addres';
              }
              return null;
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  // padding: EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.airline_seat_individual_suite),
                      hintText: '4',
                      labelText: 'Bedrooms',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '?';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // padding: EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.airline_seat_legroom_reduced),
                      hintText: '2',
                      labelText: 'Bathrooms',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '?';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: RadioListTile<LeaseDuration>(
                  title: const Text('6mo'),
                  value: LeaseDuration.sixmonths,
                  groupValue: _duration,
                  onChanged: (LeaseDuration value) {
                    setState(() {
                      _duration = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<LeaseDuration>(
                  title: const Text('1yr'),
                  value: LeaseDuration.oneyear,
                  groupValue: _duration,
                  onChanged: (LeaseDuration value) {
                    setState(() {
                      _duration = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<LeaseDuration>(
                  title: const Text('2yr'),
                  value: LeaseDuration.twoyears,
                  groupValue: _duration,
                  onChanged: (LeaseDuration value) {
                    setState(() {
                      _duration = value;
                    });
                  },
                ),
              ),
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your properties addres';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('List Your Property'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: createForm,
        ));
  }
}

class PropertyListing extends StatefulWidget {
  PropertyListing({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _PropertyListingState createState() => _PropertyListingState();
}

class _PropertyListingState extends State<PropertyListing> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = _counter * 2;
    });
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                )))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Some example lake thing',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Pittsburgh, PA',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ]));

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    ));

    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true,
        ));

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'images/ialicante-mediterranean-homes-475777-unsplash.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(child: Text('$_favoriteCount')),
        ),
      ],
    );
  }
}
