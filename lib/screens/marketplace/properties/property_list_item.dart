import 'package:flutter/material.dart';
import 'package:neo/screens/marketplace/properties/index.dart';
import 'package:neo/view_models/property_model.dart';

class PropertyListItem extends StatelessWidget {
  final PropertyModel property;

  PropertyListItem(this.property);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                PropertyWidget(property: property)
          )
        )
      },
      child: ListTile(
        title: Text(property.fullAddress),
        subtitle: Text("\$1440.00"),
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
