import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:neo/blocs/create_property_bloc.dart';
import 'package:neo/models/rental_input_model.dart';
import 'package:neo/providers/property_provider.dart';
import 'package:provider/provider.dart';
import 'package:search_map_place/search_map_place.dart';

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
  RentalInput rental = RentalInput();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreatePropertyBLoC>(context);

    return Form(
      key: _formKey,
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchMapPlaceWidget(
            placeholder: "Your Properties Address",
            apiKey: DotEnv().env['GOOGLE_SEARCH_API_KEY'],
            // The language of the autocompletion
            language: 'en',
            // The position used to give better recomendations. In this case we are using the user position
//            location: userPosition.coordinates,
//            radius: 30000,
            onSelected: (Place place) async {
              print(place.description);
              final geolocation = await place.geolocation;

              print(geolocation.coordinates);
              print(geolocation.bounds);
            },
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.home),
                      labelText: 'Property Type',
                    ),
                    value: rental.propertyType,
                    items: rental.propertyTypeValues.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) =>
                        setState(() => rental.propertyType = value),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Status',
                    ),
                    value: rental.rentalStatus,
                    items: rental.rentalStatusValues.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) =>
                        setState(() => rental.rentalStatus = value),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: TextFormField(
                    onSaved: (val) =>
                        setState(() => rental.bedrooms = int.parse(val)),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.check),
                      hintText: '750.00',
                      labelText: 'Deposit',
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
                        setState(() => rental.rentMonthly = double.parse(val)),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.attach_money),
                      hintText: '1,000.00',
                      labelText: 'Monthly Rent',
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
                child: Container(
                  child: TextFormField(
                    onSaved: (val) =>
                        setState(() => rental.bedrooms = int.parse(val)),
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
                        setState(() => rental.bathrooms = int.parse(val)),
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

//                    bloc.createProperty(rental).then((property) {
//                      Scaffold.of(context).showSnackBar(SnackBar(
//                          content: Text('Successfully saved property')));
//                      Navigator.pop(context);
//                    });
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
