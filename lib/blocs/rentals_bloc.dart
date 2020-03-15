import 'package:meta/meta.dart';
import 'package:neo/models/rental_input_model.dart';
import 'package:neo/models/rental_model.dart';
import 'package:neo/providers/rental_provider.dart';
import 'package:neo/view_models/rental_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';

class RentalsBLoC {
  final rentals = BehaviorSubject<List<RentalModel>>();
  final RentalProvider rentalProvider;

  RentalsBLoC({
    @required this.rentalProvider,
  }) {
    getRentals()
        .then(toViewModel)
        .then(rentals.add)
        .catchError((err) => print('Error getting property $err'));
  }

  Future<List<Rental>> getRentals() {
    return rentalProvider.getRentals();
  }

  Future<Rental> createRental(RentalInput rental) {
    return rentalProvider.createRental(rental);
  }

  final currencyFormatter = new NumberFormat("\$#,##0.00", "en_US");

  List<RentalModel> toViewModel(List<Rental> dataModelList) {
    return dataModelList
        .map(
          (dataModel) => RentalModel(
            id: dataModel.id,
            fullAddress:
                '${dataModel.address} ${dataModel.city}, ${dataModel.state}',
            address: dataModel.address,
            fullCityState: '${dataModel.city}, ${dataModel.state}',
            rentDeposit: currencyFormatter.format(dataModel.rentDeposit),
            rentMonthly: currencyFormatter.format(dataModel.rentMonthly),
            listingDate: DateFormat('yyyy-MM-dd').format(dataModel.listingDate),
            listingDay: DateFormat('EEEEE').format(dataModel.listingDate),
          ),
        )
        .toList(growable: false);
  }

  void dispose() {
    rentals.close();
  }
}
