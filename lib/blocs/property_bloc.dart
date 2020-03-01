//import 'package:meta/meta.dart';
//import 'package:neo/models/property_model.dart';
//import 'package:neo/providers/property_provider.dart';
//import 'package:neo/view_models/property_model.dart';
//import 'package:rxdart/rxdart.dart';
//
//class PropertyBLoC {
//  final property = BehaviorSubject<PropertyModel>();
//  final PropertyProvider propertyProvider;
//
//  PropertiesBLoC({
//    @required this.propertyProvider,
//  }) {
//    getPropertyById(id)
//        .then(toViewModel)
//        .then(properties.add)
//        .catchError((err) => print('Error getting property $err'));
//  }
//
//  Future<Property> getPropertyById(int id) {
//    return propertyProvider.getPropertyById(id);
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
