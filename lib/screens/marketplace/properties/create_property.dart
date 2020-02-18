import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:neo/model/app_state.dart';
import 'package:neo/model/property.dart';
import 'package:neo/redux/actions.dart';

class CreateProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnPropertyAddedCallback>(
      converter: (store) {
        return (address) => store.dispatch(
              AddPropertyAction(Property(5, address)),
            );
      },
      builder: (context, callback) {
        return CreatePropertyWidget(callback);
      },
    );
  }
}

class CreatePropertyWidget extends StatefulWidget {
  final OnPropertyAddedCallback callback;

  CreatePropertyWidget(this.callback);

  @override
  State<StatefulWidget> createState() => CreatePropertyWidgetState(callback);
}

enum LeaseDuration { sixmonths, oneyear, twoyears }

class CreatePropertyWidgetState extends State<CreatePropertyWidget> {
  final _formKey = GlobalKey<FormState>();
  final OnPropertyAddedCallback callback;

  CreatePropertyWidgetState(this.callback);

  String _address;
  int _bedrooms;
  int _bathrooms;
  LeaseDuration _duration = LeaseDuration.oneyear;

  @override
  Widget build(BuildContext context) {
    Widget createForm = Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            onChanged: (value) {
              setState(() {
                _address = value;
              });
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.home),
              hintText: '1234 Main St. Pittsburgh, PA 15217',
              labelText: 'Property Address',
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
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _bedrooms = int.parse(value);
                      });
                    },
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
                    onChanged: (value) {
                      setState(() {
                        _bathrooms = int.parse(value);
                      });
                    },
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  callback(_address);
                  Navigator.pushNamed(context, '/properties/list');
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

typedef OnPropertyAddedCallback = Function(String address);
