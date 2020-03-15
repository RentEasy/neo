import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neo/data/graphql.dart';
import 'package:neo/models/rental_input_model.dart';
import 'package:neo/models/rental_model.dart';

class RentalProvider {
  // method will give us Data model
  Future<List<Rental>> getRentals() {
    return getGraphQLClient()
        .query(QueryOptions(documentNode: gql(getRentalsQuery)))
        .then(_toRentals);
  }

  Future<Rental> createRental(RentalInput rental) {
    var options =
    MutationOptions(documentNode: gql(createRentalQuery), variables: rental.toJson());
    var mutator = getGraphQLClient().mutate(options);
    return mutator.then(_toRental);
  }

  List<Rental> _toRentals(QueryResult queryResult) {
    if (queryResult.hasException) {
      throw queryResult.exception;
    }

    final list = queryResult.data['rentals'] as List<dynamic>;

    return list
        .map((repoJson) => Rental.fromJson(repoJson))
        .toList(growable: false);
  }

  Rental _toRental(QueryResult queryResult) {
    if (queryResult.hasException) {
      throw queryResult.exception;
    }

    return Rental.fromJson(queryResult.data['rental']);
  }
}

// Graph Query to get repository of current user
const String getRentalsQuery = r'''
query GetRentals {
  rentals {
    bathrooms
    bedrooms
    id
    listingDate
    rentDeposit
    rentMonthly
    __typename
    property {
      id
      address
      city
      sqft
      state
      style
      zipcode
      __typename  
    }
  }
}
''';

//
const String createRentalQuery = r"""
mutation CreateRental(
  $zipcode: String!, 
  $address: String!, 
  $city: String!, 
  $state: String!, 
  $propertyType: String!, 
  $rentalStatus: String!, 
  $bedrooms: Int!, 
  $bathrooms: Int!, 
  $rentDeposit: Float!, 
  $rentMonthly: Float!
) {
  createRental(
    address: $address, 
    city: $city, 
    state: $state,
    zipcode: $zipcode,
    propertyType: $propertyType,
    rentalStatus: $rentalStatus, 
    bedrooms: $bedrooms,
    bathrooms: $bathrooms, 
    rentDeposit: $rentDeposit, 
    rentMonthly: $rentMonthly 
   ){
    bathrooms
    bedrooms
    id
    listingDate
    rentDeposit
    rentMonthly
    __typename
    property {
      id
      address
      city
      sqft
      state
      style
      zipcode
      __typename  
    }
  }
}
""";

