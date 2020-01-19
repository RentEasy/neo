import 'package:flutter/material.dart';

class CreateProperty extends StatefulWidget {
  final title = "Create Property";

  @override
  _CreatePropertyState createState() => _CreatePropertyState();
}

enum LeaseDuration { sixmonths, oneyear, twoyears }

class _CreatePropertyState extends State<CreateProperty> {
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
