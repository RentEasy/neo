import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:neo/model/app_state.dart';
import 'package:neo/model/property.dart';

class PropertyListItem extends StatelessWidget {
  final Property property;

  PropertyListItem(this.property);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(property.address),
      subtitle: Text(property.price.toString()),
      // leading: StoreConnector<AppState, OnStateChanged>(converter: (store) {
      //   return (item) => store.dispatch(ToggleItemStateAction(item.name));
      // }, builder: (context, callback) {
      //   return Checkbox(
      //       value: item.checked,
      //       onChanged: (bool newValue) {
      //         callback(CartItem(item.name, newValue));
      //       });
      // }),
      // trailing: StoreConnector<AppState, OnRemoveIconClicked>(
      //   converter: (store) {
      //     return (item) => store.dispatch(RemoveItemAction(item));
      //   },
      //   builder: (context, callback) {
      //     return IconButton(
      //       icon: Icon(Icons.delete),
      //       onPressed: () {
      //         callback(CartItem(item.name, item.checked));
      //       },
      //     );
      //   },
      // ),
    );
  }
}

typedef OnStateChanged = Function(Property property);

typedef OnRemoveIconClicked = Function(Property property);
