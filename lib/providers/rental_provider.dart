import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neo/data/graphql.dart';
import 'package:neo/models/rental_model.dart';

class RentalProvider {
  // method will give us Data model
  Future<List<Rental>> getRentals() {
    return getGraphQLClient()
        .query(QueryOptions(documentNode: gql(getRentalsQuery)))
        .then(_toRentals);
  }

//  Future<Rental> createRental(Rental rental) {
//    var options =
//        MutationOptions(documentNode: gql(createRentalQuery), variables: {
//      'address': rental.address,
//      'city': 'Pittsburgh',
//      'state': 'PA',
//      'zipcode': '15217',
//    });
//    var mutator = getGraphQLClient().mutate(options);
//    return mutator.then(_toRentalFromCreate);
//  }

//  Future<Rental> getRentalById(int id) {
//    return getGraphQLClient()
//        .query(QueryOptions(
//          documentNode: gql(getRentalQuery),
//          variables: {'id': id},
//        ))
//        .then(_toRental);
//  }

//  Rental _toRentalFromCreate(QueryResult queryResult) {
//    if (queryResult.hasException) {
//      throw queryResult.exception;
//    }
//
//    return Rental.fromJson(queryResult.data['create']);
//  }

//  Rental _toRental(QueryResult queryResult) {
//    if (queryResult.hasException) {
//      throw queryResult.exception;
//    }
//
//    return Rental.fromJson(queryResult.data['rental']);
//  }

  List<Rental> _toRentals(QueryResult queryResult) {
    if (queryResult.hasException) {
      throw queryResult.exception;
    }

    final list = queryResult.data['rentals'] as List<dynamic>;

    return list
        .map((repoJson) => Rental.fromJson(repoJson))
        .toList(growable: false);
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
//const String getRentalQuery = """
//query GetRental(\$id: Int!) {
//  rental(id: \$id){
//    address
//    city
//    id
//    sqft
//    state
//    style
//    zipcode
//    __typename
//  }
//}
//""";
//const String createRentalQuery = r"""
//mutation CreateRental($zipcode: String!, $address: String!, $city: String!, $state: String!) {
//  create(zipcode: $zipcode, address: $address, city: $city, state: $state){
//    address
//    city
//    id
//    sqft
//    state
//    style
//    zipcode
//    __typename
//  }
//}
//""";
