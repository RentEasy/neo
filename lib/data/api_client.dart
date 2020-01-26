import '../model/property.dart';

class ApiClient {
  Future<List<Property>> fetchProperties() {
    return Future.delayed(Duration(seconds: 3), () {
      return [
        Property(1, '1234 Fake St'),
        Property(2, '4321 Main St'),
        Property(3, '9238 Forward Ave'),
      ];
    });
  }
}
