
class ApplicationInput {
  String firstName;
  String lastName;

  ApplicationInput({this.firstName, this.lastName});

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
      };
}
