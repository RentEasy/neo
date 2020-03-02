import 'package:flutter/material.dart';
import 'package:neo/screens/marketplace/properties/index.dart';
import 'package:neo/view_models/property_model.dart';

class PropertyListItemWidget extends StatelessWidget {
  final PropertyModel property;

  PropertyListItemWidget(this.property);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PropertyWidget(property: property)))
      },
      child: ListTile(
        title: Text(property.fullAddress),
        subtitle: Text("\$1440.00"),
        leading: Image.asset(
          'images/ialicante-mediterranean-homes-475777-unsplash.jpg',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
