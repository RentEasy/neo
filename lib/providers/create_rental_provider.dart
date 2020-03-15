import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neo/data/graphql.dart';
import 'package:neo/models/property_model.dart';
import 'package:neo/models/rental_input_model.dart';
import 'package:neo/models/rental_model.dart';

class CreateRentalProvider {
  // method will give us Data model
  Future<Rental> createRental(RentalInput rental) {
    var options =
        MutationOptions(documentNode: gql(createPropertyQuery), variables: rental.toJson());
    var mutator = getGraphQLClient().mutate(options);
    return mutator.then(_toRental);
  }

  Rental _toRental(QueryResult queryResult) {
    if (queryResult.hasException) {
      throw queryResult.exception;
    }

    return Rental.fromJson(queryResult.data['rental']);
  }
}

const String createPropertyQuery = r"""
mutation CreateProperty($zipcode: String!, $address: String!, $city: String!, $state: String!) {
  create(zipcode: $zipcode, address: $address, city: $city, state: $state){
    address
    city
    id
    sqft
    state
    style
    zipcode
    __typename
  }
}
""";
