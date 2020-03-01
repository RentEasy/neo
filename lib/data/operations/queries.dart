class PropertyQueries {
  String getProperties() {
    return """
  query {
    list {
      id
      address
      city
      sqft
      state
      zipcode
      __typename
    }
  }
""";
  }
}
