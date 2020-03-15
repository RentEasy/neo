import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:neo/blocs/create_property_bloc.dart';
import 'package:neo/blocs/create_rental_bloc.dart';
import 'package:neo/models/rental_input_model.dart';
import 'package:neo/providers/geocode_provider.dart';
import 'package:neo/providers/rental_provider.dart';
import 'package:neo/providers/create_rental_provider.dart';
import 'package:provider/provider.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';

class CreatePropertyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CreateRentalBLoC>(
      create: (_) => CreateRentalBLoC(rentalProvider: CreateRentalProvider()),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
          appBar: AppBar(title: Text('List Your Property')),
          body: CreatePropertyForm()),
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
  Completer<GoogleMapController> _mapController = Completer();

  RentalInput rental = RentalInput();

  final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(40.441758, -79.980339),
    zoom: 18.0000,
  );

  //<editor-fold desc="Widgets">
  Widget _addressPickerWidget() {
    return Stack(
      children: <Widget>[
        _googleMapWidget(),
        Positioned(
          top: 20,
          left: MediaQuery.of(context).size.width * 0.05,
          child: _searchMapWidget(),
        )
      ],
    );
  }

  Widget _googleMapWidget() {
    return GoogleMap(
      myLocationButtonEnabled: false,
      rotateGesturesEnabled: false,
      scrollGesturesEnabled: false,
      zoomGesturesEnabled: false,
      tiltGesturesEnabled: false,
      mapToolbarEnabled: false,
      compassEnabled: false,
      mapType: MapType.hybrid,
      initialCameraPosition: _initialCamera,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  Widget _searchMapWidget() {
    return SearchMapPlaceWidget(
      placeholder: "Your Properties Address",
      apiKey: DotEnv().env['GOOGLE_SEARCH_API_KEY'],
      language: 'en',
      onSelected: (Place place) async {
        print(place.description);
        final geolocation = await place.geolocation;

        final GoogleMapController controller = await _mapController.future;

        controller
            .animateCamera(CameraUpdate.newLatLng(geolocation.coordinates));

        var address = GeocodeProvider.convertAddress(geolocation.fullJSON);


        rental.address = address['addressLine'];
        rental.city = address['locality'];
        rental.state = address['adminArea'];
        rental.zipcode = address['postalCode'];

        rental.coordinates = geolocation.coordinates;
      },
    );
  }

  Widget _propertyTypeSelector() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        icon: Icon(Icons.home),
        labelText: 'Property Type',
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      ),
      value: rental.propertyType,
      items: rental.propertyTypeValues.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (String value) => setState(() => rental.propertyType = value),
    );
  }

  Widget _propertyStatusSelector() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Status',
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      ),
      value: rental.rentalStatus,
      items: rental.rentalStatusValues.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (String value) => setState(() => rental.rentalStatus = value),
    );
  }

  Widget _depositField() {
    return TextFormField(
      onSaved: (val) => setState(() => rental.rentDeposit = double.parse(val)),
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
    );
  }

  Widget _rentField() {
    return TextFormField(
      onSaved: (val) => setState(() => rental.rentMonthly = double.parse(val)),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
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
    );
  }

  Widget _bedroomsField() {
    return TextFormField(
      onSaved: (val) => setState(() => rental.bedrooms = int.parse(val)),
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
    );
  }

  Widget _bathroomsField() {
    return TextFormField(
      onSaved: (val) => setState(() => rental.bathrooms = int.parse(val)),
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
    );
  }

  Widget _form(CreateRentalBLoC bloc) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _propertyTypeSelector(),
          _propertyStatusSelector(),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: _depositField(),
                ),
              ),
              Expanded(
                child: Container(
                  child: _rentField(),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: _bedroomsField(),
                ),
              ),
              Expanded(
                child: Container(
                  child: _bathroomsField(),
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

                    print(rental.toJson());
//                    bloc.createRental(rental).then((property) {
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

  //</editor-fold>

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreateRentalBLoC>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: _addressPickerWidget(),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: _form(bloc),
            ),
          ),
        ],
      ),
//      child: FractionallySizedBox(
//        widthFactor: 1.0,
//        heightFactor: 0.5,
//        child: _addressPickerWidget(),
//      ),
    );
  }
}
