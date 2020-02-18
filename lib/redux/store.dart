import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

import 'package:neo/data/api_client.dart';
import 'package:neo/model/app_state.dart';
import 'package:neo/redux/api_middleware.dart';
import 'package:neo/redux/logging_middleware.dart';
import 'package:neo/redux/reducers.dart';

Future<Store<AppState>> createReduxStore() async {
  final apiClient = ApiClient();
  // final sharedPreferences = await SharedPreferences.getInstance();

  return DevToolsStore<AppState>(
    appStateReducers,
    initialState: AppState.empty(),
    middleware: [
      ApiMiddleware(apiClient),
      // PrefsMiddleware(sharedPreferences),
      LoggingMiddleware(),
    ],
  );
}
