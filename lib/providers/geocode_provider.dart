

class GeocodeProvider {

  static Map _convertCoordinates(dynamic geometry) {
    if(geometry == null)
      return null;

    var location = geometry["location"];
    if(location == null)
      return null;

    return {
      "latitude" : location["lat"],
      "longitude" : location["lng"],
    };
  }

  static Map convertAddress(dynamic data) {

    Map result = Map();

    result["coordinates"] = _convertCoordinates(data["geometry"]);
    result["addressLine"] = data["formatted_address"];

    var addressComponents = data["address_components"];

    addressComponents.forEach((item) {

      List types = item["types"];

      if(types.contains("route")) {

        result["thoroughfare"] = item["long_name"];
      }
      else if(types.contains("street_number")) {

        result["subThoroughfare"] = item["long_name"];
      }
      else if(types.contains("country")) {
        result["countryName"] = item["long_name"];
        result["countryCode"] = item["short_name"];
      }
      else if(types.contains("locality")) {
        result["locality"] = item["long_name"];
      }
      else if(types.contains("postal_code")) {
        result["postalCode"] = item["long_name"];
      }
      else if(types.contains("postal_code")) {
        result["postalCode"] = item["long_name"];
      }
      else if(types.contains("administrative_area_level_1")) {
        result["adminArea"] = item["long_name"];
      }
      else if(types.contains("administrative_area_level_2")) {
        result["subAdminArea"] = item["long_name"];
      }
      else if(types.contains("sublocality") || types.contains("sublocality_level_1")) {
        result["subLocality"] = item["long_name"];
      }
      else if(types.contains("premise")) {
        result["featureName"] = item["long_name"];
      }

      result["featureName"] = result["featureName"] ?? result["addressLine"];

    });

    return result;
  }
}