import 'package:flutter/material.dart';
import 'package:neo/view_models/rental_model.dart';

class PropertyScreen extends StatelessWidget {
  final RentalModel rental;

  PropertyScreen({this.rental});

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget rentSection = Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Rent"),
            Text(rental.rentMonthly),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Deposit"),
            Text(rental.rentDeposit),
          ],
        )
      ],
    );

    Widget titleSection = Container(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    rental.address,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  rental.fullCityState,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: rentSection,
          ),
//          FavoriteWidget(),
        ]));

    Color color = Theme.of(context).primaryColor;

//    Widget buttonSection = Container(
//        child: Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        _buildButtonColumn(color, Icons.call, 'CALL'),
//        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
//        _buildButtonColumn(color, Icons.share, 'SHARE'),
//      ],
//    ));
    Widget buttonSection = Container(
      margin: EdgeInsets.only(left: 32.0, right: 32.0),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text("Apply Now"),
        onPressed: () => Navigator.pushNamed(context, '/application/submit'),
      ),
    );

    Widget textSection = Container(
        padding: const EdgeInsets.all(16),
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
        title: Text(rental.address),
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
    );
  }
}
