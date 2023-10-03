import 'package:redux_api/models/user_model.dart';

class FetchUserListAction {}

class SetUserListAction {
  final List<User> users;

  SetUserListAction({required this.users});
}

class ViewUserDetailAction {
  final int userId;
  ViewUserDetailAction({required this.userId});
}

class SetUserDetailAction {
  final User userDetail;

  SetUserDetailAction({required this.userDetail});
}
