import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_api/actions/user_actions.dart';
import 'package:redux_api/models/user_model.dart';
import 'package:redux_api/store/store.dart';

class UserDetail extends StatefulWidget {
  final int userId;
  const UserDetail({required this.userId, super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  void initState() {
    super.initState();
    store.dispatch(ViewUserDetailAction(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<dynamic, User>(
        converter: (store) => store.state,
        builder: (context, userDetail) {
          return Text(userDetail.first_name);
        },
      ),
    );
  }
}
