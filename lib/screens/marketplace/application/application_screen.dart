import 'package:flutter/material.dart';
import 'package:neo/blocs/rentals_bloc.dart';
import 'package:neo/models/application_input_model.dart';
import 'package:neo/providers/rental_provider.dart';
import 'package:provider/provider.dart';

class ApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<RentalsBLoC>(
      create: (_) => RentalsBLoC(rentalProvider: RentalProvider()),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
          appBar: AppBar(title: Text('Apply for Rental')),
          body: ApplicationForm()),
    );
  }
}

class ApplicationForm extends StatefulWidget {
  @override
  _CreateApplicationFormState createState() {
    return _CreateApplicationFormState();
  }
}

class _CreateApplicationFormState extends State<ApplicationForm> {
  final _formKey = GlobalKey<FormState>();

  ApplicationInput application = ApplicationInput();

  //<editor-fold desc="Widgets">
  Widget _firstNameField() {
    return TextFormField(
      onSaved: (val) => setState(() => application.firstName = val),
      decoration: const InputDecoration(
        icon: Icon(Icons.airline_seat_legroom_reduced),
        hintText: '2',
        labelText: 'First Name',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return '?';
        }
        return null;
      },
    );
  }

  Widget _lastNameField() {
    return TextFormField(
      onSaved: (val) => setState(() => application.lastName = val),
      decoration: const InputDecoration(
        icon: Icon(Icons.airline_seat_legroom_reduced),
        hintText: '2',
        labelText: 'Last Name',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return '?';
        }
        return null;
      },
    );
  }

  Widget _form(RentalsBLoC bloc) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _firstNameField(),
          _lastNameField(),
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

                    print(application.toJson());
//                    bloc.createRental(rental).then((property) {
//                      Scaffold.of(context).showSnackBar(SnackBar(
//                          content: Text('Successfully saved property')));
//                      Navigator.pop(context);
//                    });
                  }
                },
                child: Text('Submit Application'),
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
    final bloc = Provider.of<RentalsBLoC>(context);

    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: _form(bloc),
            ),
          ),
        ],
      ),
    );
  }
}
