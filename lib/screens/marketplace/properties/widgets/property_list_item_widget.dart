import 'package:flutter/material.dart';
import 'package:neo/screens/marketplace/properties/index.dart';
import 'package:neo/view_models/rental_model.dart';

class PropertyListItemWidget extends StatelessWidget {
  final RentalModel rental;

  PropertyListItemWidget(this.rental);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PropertyScreen(rental: rental)))
      },
      child: ListTile(
        title: Text(rental.address),
        subtitle: Text("Listed on ${rental.listingDay} for ${rental.rentMonthly}/mo"),
        leading: Image.asset(
          'images/ialicante-mediterranean-homes-475777-unsplash.jpg',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
