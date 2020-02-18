import 'package:flutter/material.dart';
import 'package:neo/model/property.dart';
import 'package:neo/screens/marketplace/properties/single_property.dart';

class PropertyListItem extends StatelessWidget {
  final Property property;

  PropertyListItem(this.property);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(
          context,
          '/properties/property',
          arguments: PropertyArguments(
            property.address,
          ),
        ),
      },
      child: ListTile(
        title: Text(property.address),
        subtitle: Text(property.price.toString()),
        leading: Image.asset(
          'images/ialicante-mediterranean-homes-475777-unsplash.jpg',
          fit: BoxFit.fitHeight,
        ),
      ),
    );

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
  }
}

typedef OnStateChanged = Function(Property property);

typedef OnRemoveIconClicked = Function(Property property);
