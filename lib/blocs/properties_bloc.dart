import 'package:meta/meta.dart';
import 'package:neo/models/property_model.dart';
import 'package:neo/providers/property_provider.dart';
import 'package:neo/view_models/property_model.dart';
import 'package:rxdart/rxdart.dart';

class PropertiesBLoC {
  final properties = BehaviorSubject<List<PropertyModel>>();
  final PropertyProvider propertyProvider;

  PropertiesBLoC({
    @required this.propertyProvider,
  }) {
    getProperties()
        .then(toViewModel)
        .then(properties.add)
        .catchError((err) => print('Error getting property $err'));
  }

  Future<List<Property>> getProperties() {
    return propertyProvider.getProperties();
  }

  List<PropertyModel> toViewModel(List<Property> dataModelList) {
    return dataModelList
        .map(
          (dataModel) => PropertyModel(
            id: dataModel.id,
            fullAddress:
                '${dataModel.address} ${dataModel.city}, ${dataModel.state}',
          ),
        )
        .toList(growable: false);
  }

  void dispose() {
    properties.close();
  }
}
