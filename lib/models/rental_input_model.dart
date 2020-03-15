import 'package:google_maps_flutter/google_maps_flutter.dart';

class RentalInput {
  final List<String> propertyTypeValues = [
    "Apartment",
    "House",
    "Townhome",
    "Unit",
  ];

  final List<String> rentalStatusValues = [
    "Off-market",
    "Rented",
    "Vacant",
  ];

  String address;
  String city;
  String state;
  String zipcode;

  LatLng coordinates;

  String propertyType;
  String rentalStatus;
  String unit;
  int sqft;
  int bedrooms;
  int bathrooms;
  int stories;

  double rentDeposit;
  double rentMonthly;

  RentalInput({this.address, this.city, this.state, this.zipcode});

  Map<String, dynamic> toJson() => {
        'address': address,
        'city': city,
        'state': state,
        'zipcode': zipcode,
        'coordinates': coordinates.toString(),
        'propertyType': propertyType,
        'rentalStatus': rentalStatus,
        'unit': unit,
        'sqft': sqft,
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'stories': stories,
        'rentDeposit': rentDeposit,
        'rentMonthly': rentMonthly,
      };
}
