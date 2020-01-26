import '../data/api_client.dart';
import '../model/app_state.dart';
import 'api_middleware.dart';
import 'logging_middleware.dart';
import 'reducers.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
