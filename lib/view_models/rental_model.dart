import 'package:meta/meta.dart';

class RentalModel {
  final int id;
  final String fullAddress;
  final String address;
  final String fullCityState;
  final String rentDeposit;
  final String rentMonthly;
  final String listingDate;
  final String listingDay;

  RentalModel({
    @required this.id,
    @required this.fullAddress,
    @required this.address,
    @required this.fullCityState,
    @required this.rentDeposit,
    @required this.rentMonthly,
    @required this.listingDate,
    @required this.listingDay,
  });
}
