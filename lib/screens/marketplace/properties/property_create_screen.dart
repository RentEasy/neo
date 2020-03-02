import 'package:flutter/material.dart';
import 'package:neo/blocs/create_property_bloc.dart';
import 'package:neo/models/property_model.dart';
import 'package:neo/providers/property_provider.dart';
import 'package:provider/provider.dart';

class CreatePropertyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CreatePropertyBLoC>(
      create: (_) => CreatePropertyBLoC(
        propertyProvider: PropertyProvider(),
      ),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
          appBar: AppBar(title: Text('List Your Property')),
          body: Container(
            padding: EdgeInsets.all(10),
            child: CreatePropertyForm(),
          )),
    );
  }
}

class CreatePropertyForm extends StatefulWidget {
  @override
  _CreatePropertyFormState createState() {
    return _CreatePropertyFormState();
  }
}

class _CreatePropertyFormState extends State<CreatePropertyForm> {
  final _formKey = GlobalKey<FormState>();
  Property property = Property();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreatePropertyBLoC>(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
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
            onSaved: (val) => setState(() => property.address = val),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextFormField(
                    onSaved: (val) =>
                        setState(() => property.bedrooms = int.parse(val)),
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
                  child: TextFormField(
                    onSaved: (val) =>
                        setState(() => property.fullBaths = int.parse(val)),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  final form = _formKey.currentState;

                  if (form.validate()) {
                    form.save();

                    bloc.createProperty(property).then((property) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Successfully saved property')));
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('List Property'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
