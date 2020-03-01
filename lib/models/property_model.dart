class Property {
  int id;
  String parcel;
  String address;
  String city;
  String coordinates;
  int lotSqft;
  int sqft;
  String state;
  String zipcode;
  String useCode;
  int totalRooms;
  String basement;
  String style;
  int bedrooms;
  String grade;
  int stories;
  int fullBaths;
  int halfBaths;
  String condition;
  int yearBuilt;
  int fireplaces;
  String exteriorFinish;
  String heatingCooling;
  int basementGarage;
  String roofType;

  Property({this.id, this.address, this.city, this.state, this.zipcode});

  factory Property.fromJson(Map<String, dynamic> json) => new Property(
      id: json["id"],
      address: json["address"],
      city: json["city"],
      state: json["state"],
      zipcode: json["zipcode"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        //createdAt.toIso8601String(),
      };
}
