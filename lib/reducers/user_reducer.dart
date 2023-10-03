import 'package:redux_api/actions/user_actions.dart';
import 'package:redux_api/models/user_model.dart';

List<User> userReducer(List<User> state, action) {
  if (action is SetUserListAction) {
    return action.users;
  }
  return state;
}

User userDetailReducer(User state, action) {
  if (action is SetUserDetailAction) {
    return action.userDetail;
  }
  return state;
}

class AppState {
  final List<User> users;
  final User singleUser;

  AppState({required this.users, required this.singleUser});
}

AppState rootReducer(AppState state, action) {
  return AppState(
    users: userReducer(state.users, action),
    singleUser: userDetailReducer(state.singleUser, action),
  );
}
