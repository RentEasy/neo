import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neo/data/graphql.dart';
import 'package:neo/models/property_model.dart';

class PropertyProvider {
  // method will give us Data model
  Future<List<Property>> getProperties() {
    return getGraphQLClient()
        .query(QueryOptions(documentNode: gql(getPropertiesQuery)))
        .then(_toProperties);
  }

  // method will give us Data model
  Future<Property> createProperty(Property property) {
    var options =
        MutationOptions(documentNode: gql(createPropertyQuery), variables: {
      'address': property.address,
      'city': 'Pittsburgh',
      'state': 'PA',
      'zipcode': '15217',
    });
    var mutator = getGraphQLClient().mutate(options);
    return mutator.then(_toPropertyFromCreate);
  }

  // method will give us Data model
  Future<Property> getPropertyById(int id) {
    return getGraphQLClient()
        .query(QueryOptions(
          documentNode: gql(getPropertyQuery),
          variables: {'id': id},
        ))
        .then(_toProperty);
  }

  Property _toPropertyFromCreate(QueryResult queryResult) {
    if (queryResult.hasException) {
      throw queryResult.exception;
    }

    return Property.fromJson(queryResult.data['create']);
  }

  Property _toProperty(QueryResult queryResult) {
    if (queryResult.hasException) {
      throw queryResult.exception;
    }

    return Property.fromJson(queryResult.data['property']);
  }

  List<Property> _toProperties(QueryResult queryResult) {
    if (queryResult.hasException) {
      throw queryResult.exception;
    }

    final list = queryResult.data['list'] as List<dynamic>;

    return list
        .map((repoJson) => Property.fromJson(repoJson))
        .toList(growable: false);
  }
}

// Graph Query to get repository of current user
const String getPropertiesQuery = r'''
  query GetProperties {
  list{
    address
    city
    id
    sqft
    state
    zipcode
    __typename
  }
}
''';
const String getPropertyQuery = """
query GetProperty(\$id: Int!) {
  property(id: \$id){
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
