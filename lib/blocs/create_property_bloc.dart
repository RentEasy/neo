import 'package:neo/models/property_model.dart';
import 'package:neo/providers/rental_provider.dart';
import 'package:neo/view_models/property_model.dart';
import 'package:rxdart/rxdart.dart';
//
//class CreatePropertyBLoC {
//  final property = BehaviorSubject<PropertyModel>();
//  final PropertyProvider propertyProvider;
//
//  CreatePropertyBLoC({this.propertyProvider});
//
//  Future<Property> createProperty(Property property) {
//    return propertyProvider.createProperty(property);
//  }
//
//  PropertyModel toViewModel(Property dataModel) {
//    return PropertyModel(
//      id: dataModel.id,
//      fullAddress: '${dataModel.address} ${dataModel.city}, ${dataModel.state}',
//    );
//  }
//
//  void dispose() {
//    property.close();
//  }
//}
