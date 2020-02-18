import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:neo/model/app_state.dart';
import 'package:neo/model/property.dart';
import 'package:neo/redux/actions.dart';
import 'package:neo/screens/marketplace/properties/property_list_item.dart';
import 'package:redux/redux.dart';

class PropertyList extends StatefulWidget {
  @override
  _PropertyListState createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  bool _isLoading = false;

  _createProperty() {
    Navigator.pushNamed(context, '/properties/create');
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PropertyListViewModel>(
      converter: (store) => PropertyListViewModel.build(store),
      builder: (context, viewModel) {
        Widget propertyListView = Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => viewModel.onRefresh(_onViewStateChanged),
              child: Text('Refresh'),
            ),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: viewModel.properties.length,
                      itemBuilder: (context, position) =>
                          PropertyListItem(viewModel.properties[position]),
                    ),
            ),
          ],
        );

        return Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('Rental Marketplace'),
          ),
          body: propertyListView,
          floatingActionButton: FloatingActionButton(
            onPressed: _createProperty,
            tooltip: 'Create Property',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }

  void _onViewStateChanged(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }
}

class PropertyListViewModel {
  final List<Property> properties;
  final Function(OnStateChanged) onRefresh;

  PropertyListViewModel({this.properties, this.onRefresh});

  static PropertyListViewModel build(Store<AppState> store) {
    return PropertyListViewModel(
      properties: store.state.properties,
      onRefresh: (callback) {
        store.dispatch(FetchPropertiesAction(callback));
      },
    );
  }
}

typedef OnStateChanged = Function(bool isLoading);
