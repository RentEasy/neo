class Rental {
  int id;

  // Property Details
  String address;
  String city;
  String coordinates;
  String state;
  String zipcode;

  // Rental Details
  String unit;
  int sqft;
  int bedrooms;
  int bathrooms;
  int stories;
  double rentDeposit;
  double rentMonthly;
  DateTime listingDate;

  Rental({this.id, this.address, this.city, this.state, this.zipcode, this.unit, this.sqft, this.bedrooms, this.bathrooms, this.stories, this.rentDeposit, this.rentMonthly, this.listingDate});

  factory Rental.fromJson(Map<String, dynamic> json) => new Rental(
        id: json["id"],
        address: json["property"]["address"],
        city: json["property"]["city"],
        state: json["property"]["state"],
        zipcode: json["property"]["zipcode"],

//        unit: json["unit"],
//        sqft: json["sqft"] ?? 0,
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
//        stories: json["stories"] ?? 1,
        rentDeposit: json["rentDeposit"] + 0.00,
        rentMonthly: json["rentMonthly"] + 0.00,
        listingDate: DateTime.parse(json["listingDate"]),
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        //createdAt.toIso8601String(),
      };
}
