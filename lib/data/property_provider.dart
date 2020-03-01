import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neo/main.dart';
import 'package:neo/model/property.dart';

class PropertyProvider {
  GraphQLClient _client = graphQLConfiguration.clientToQuery();

  // method will give us Data model
  Future<List<Property>> getProperties() {
    return _client.query(_queryOptions()).then(_toProperties);
  }

// provides Graph Query options, we can provide the optional variable here
  QueryOptions _queryOptions() {
    return QueryOptions(documentNode: gql(getPropertiesQuery));
  }

// parse JSON to Data model
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
