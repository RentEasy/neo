import './actions.dart';
import '../model/app_state.dart';
import '../model/property.dart';

AppState appStateReducers(AppState state, dynamic action) {
  if (action is AddPropertyAction) {
    return addProperty(state.properties, action);
  } else if (action is PropertyLoadedAction) {
    return loadProperties(action);
  }

  return state;
}

AppState addProperty(List<Property> properties, AddPropertyAction action) {
  return AppState(List.from(properties)..add(action.property));
}

AppState loadProperties(PropertyLoadedAction action) {
  return AppState(action.properties);
}
