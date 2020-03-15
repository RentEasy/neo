import 'package:neo/models/rental_input_model.dart';
import 'package:neo/models/rental_model.dart';
import 'package:neo/providers/create_rental_provider.dart';
import 'package:neo/view_models/rental_model.dart';
import 'package:rxdart/rxdart.dart';

class CreateRentalBLoC {
  final CreateRentalProvider rentalProvider;

  CreateRentalBLoC({this.rentalProvider});

  Future<Rental> createRental(RentalInput rental) {
    return rentalProvider.createRental(rental);
  }

  RentalModel toViewModel(Rental dataModel) {
    return RentalModel(
      id: dataModel.id,
      fullAddress: '${dataModel.address} ${dataModel.city}, ${dataModel.state}',
    );
  }

  void dispose() {

  }

}
