import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:redux_api/actions/user_actions.dart';
import 'package:redux_api/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:redux_api/reducers/user_reducer.dart';

void thunkMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  if (action is FetchUserListAction) {
    try {
      var response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=2'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> userList = responseData['data'];
        final List<User> users = userList
            .map(
              (e) => User.fromJson(e),
            )
            .toList();
        store.dispatch(
          SetUserListAction(users: users),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  } else if (action is ViewUserDetailAction) {
    try {
      var response = await http.get(
        Uri.parse('https://reqres.in/api/users/${action.userId}'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final User user = User.fromJson(responseData['data']);
        store.dispatch(
          SetUserDetailAction(userDetail: user),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  } else {
    next(action);
  }
}
