import 'package:redux/redux.dart';

import 'package:neo/redux/actions.dart';
import 'package:neo/data/api_client.dart';
import 'package:neo/model/app_state.dart';

class ApiMiddleware extends MiddlewareClass<AppState> {
  final ApiClient apiClient;

  ApiMiddleware(this.apiClient);

  @override
  Future call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is FetchPropertiesAction) {
      return _fetchProperties(store, action);
    }

    next(action);
  }

  Future _fetchProperties(
      Store<AppState> store, FetchPropertiesAction action) async {
    action.callback(true);
    var cartItems = await apiClient.fetchProperties();
    store.dispatch(PropertyLoadedAction(cartItems));
    action.callback(false);
  }
}
