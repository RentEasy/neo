import 'package:flutter/material.dart';
import 'package:neo/blocs/create_property_bloc.dart';
import 'package:neo/models/property_model.dart';
import 'package:neo/providers/property_provider.dart';
import 'package:neo/screens/marketplace/properties/property_widget.dart';
import 'package:provider/provider.dart';

//
//class CreateProperty extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final bloc = Provider.of<CreatePropertyBLoC>(context);
//
//    return StoreConnector<AppState, OnPropertyAddedCallback>(
//      converter: (store) {
//        return (address) => store.dispatch(
//              AddPropertyAction(Property(5, address)),
//            );
//      },
//      builder: (context, callback) {
//        return CreatePropertyWidget(callback);
//      },
//    );
//  }
//}
//
//class CreatePropertyWidget extends StatefulWidget {
//  final OnPropertyAddedCallback callback;
//
//  CreatePropertyWidget(this.callback);
//
//  @override
//  State<StatefulWidget> createState() => CreatePropertyWidgetState(callback);
//}
//
enum LeaseDuration { sixmonths, oneyear, twoyears }

class CreatePropertyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CreatePropertyBLoC>(
      create: (_) => CreatePropertyBLoC(
        propertyProvider: PropertyProvider(),
      ),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
          appBar: AppBar(title: Text('Create Property')),
          body: CreatePropertyForm()),
    );
  }
}

class CreatePropertyForm extends StatefulWidget {
  @override
  CreatePropertyFormState createState() {
    return CreatePropertyFormState();
  }
}

class CreatePropertyFormState extends State<CreatePropertyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreatePropertyBLoC>(context);

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  bloc
                      .createProperty(Property(
                        address: "Herp",
                      ))
                      .then((property) => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PropertyWidget(
                                    property: bloc.toViewModel(property))))
                          });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
//
//class CreatePropertyWidget extends StatefulWidget {
//  final _formKey = GlobalKey<FormState>();
//
//  String _address;
//  int _bedrooms;
//  int _bathrooms;
//  LeaseDuration _duration = LeaseDuration.oneyear;
//
//  @override
//  Widget build(BuildContext context) {
//    final bloc = Provider.of<CreatePropertyBLoC>(context);
//
//    Widget createForm = Form(
//      key: _formKey,
//      child: ListView(
//        children: <Widget>[
//          TextFormField(
//            onChanged: (value) {
//              setState(() {
//                _address = value;
//              });
//            },
//            decoration: const InputDecoration(
//              icon: Icon(Icons.home),
//              hintText: '1234 Main St. Pittsburgh, PA 15217',
//              labelText: 'Property Address',
//            ),
//            validator: (value) {
//              if (value.isEmpty) {
//                return 'Please enter your properties addres';
//              }
//              return null;
//            },
//          ),
////          Row(
////            children: <Widget>[
////              Expanded(
////                child: Container(
////                  child: TextFormField(
////                    onChanged: (value) {
////                      setState(() {
////                        _bedrooms = int.parse(value);
////                      });
////                    },
////                    keyboardType: TextInputType.number,
////                    decoration: const InputDecoration(
////                      icon: Icon(Icons.airline_seat_individual_suite),
////                      hintText: '4',
////                      labelText: 'Bedrooms',
////                    ),
////                    validator: (value) {
////                      if (value.isEmpty) {
////                        return '?';
////                      }
////                      return null;
////                    },
////                  ),
////                ),
////              ),
////              Expanded(
////                child: Container(
////                  // padding: EdgeInsets.all(10),
////                  child: TextFormField(
////                    onChanged: (value) {
////                      setState(() {
////                        _bathrooms = int.parse(value);
////                      });
////                    },
////                    keyboardType: TextInputType.number,
////                    decoration: const InputDecoration(
////                      icon: Icon(Icons.airline_seat_legroom_reduced),
////                      hintText: '2',
////                      labelText: 'Bathrooms',
////                    ),
////                    validator: (value) {
////                      if (value.isEmpty) {
////                        return '?';
////                      }
////                      return null;
////                    },
////                  ),
////                ),
////              ),
////            ],
////          ),
////          Row(
////            children: <Widget>[
////              Expanded(
////                child: RadioListTile<LeaseDuration>(
////                  title: const Text('6mo'),
////                  value: LeaseDuration.sixmonths,
////                  groupValue: _duration,
////                  onChanged: (LeaseDuration value) {
////                    setState(() {
////                      _duration = value;
////                    });
////                  },
////                ),
////              ),
////              Expanded(
////                child: RadioListTile<LeaseDuration>(
////                  title: const Text('1yr'),
////                  value: LeaseDuration.oneyear,
////                  groupValue: _duration,
////                  onChanged: (LeaseDuration value) {
////                    setState(() {
////                      _duration = value;
////                    });
////                  },
////                ),
////              ),
////              Expanded(
////                child: RadioListTile<LeaseDuration>(
////                  title: const Text('2yr'),
////                  value: LeaseDuration.twoyears,
////                  groupValue: _duration,
////                  onChanged: (LeaseDuration value) {
////                    setState(() {
////                      _duration = value;
////                    });
////                  },
////                ),
////              ),
////            ],
////          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(vertical: 16.0),
//            child: RaisedButton(
//              onPressed: () {
//                // Validate will return true if the form is valid, or false if
//                // the form is invalid.
//                if (_formKey.currentState.validate()) {
//                  bloc.createProperty(Property(
//                    address: _address,
//                  ));
//                  Navigator.pushNamed(context, '/properties/list');
//                }
//              },
//              child: Text('Submit'),
//            ),
//          ),
//        ],
//      ),
//    );
//
//    return Scaffold(
//        appBar: AppBar(
//          // Here we take the value from the MyHomePage object that was created by
//          // the App.build method, and use it to set our appbar title.
//          title: Text('List Your Property'),
//        ),
//        body: Container(
//          padding: EdgeInsets.all(10),
//          child: createForm,
//        ));
//  }
//}
