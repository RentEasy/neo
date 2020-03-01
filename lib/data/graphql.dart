import 'dart:io';

import 'package:graphql/client.dart';

final HttpLink _httpLink = HttpLink(
  uri: 'http://localhost:8080/graphql',
);

final Link _link = _httpLink;

GraphQLClient _client;

GraphQLClient getGraphQLClient() {
  _client ??= GraphQLClient(
    link: _link,
    cache: InMemoryCache(),
  );

  return _client;
}
