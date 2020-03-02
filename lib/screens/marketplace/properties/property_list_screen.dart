import 'package:flutter/material.dart';
import 'package:neo/blocs/properties_bloc.dart';
import 'package:neo/screens/marketplace/properties/widgets/property_list_item_widget.dart';
import 'package:neo/view_models/property_model.dart';
import 'package:provider/provider.dart';

class PropertyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rental Marketplace')),
      body: PropertyListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/properties/create');
        },
        tooltip: 'Create Property',
        child: Icon(Icons.add),
      ),
    );
  }
}

class PropertyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<PropertiesBLoC>(context).properties,
      builder: (context, propertiesSnapshot) {
        if (!propertiesSnapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final list = propertiesSnapshot.data as List<PropertyModel>;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) =>
              PropertyListItemWidget(list[position]),
        );
      },
    );
  }
}
