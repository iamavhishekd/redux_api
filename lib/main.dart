import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_api/actions/user_actions.dart';
import 'package:redux_api/models/user_model.dart';
import 'package:redux_api/reducers/user_reducer.dart';
import 'package:redux_api/store/store.dart';
import 'package:redux_api/user_detail.dart';

void main() {
  store.dispatch(FetchUserListAction());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.store, super.key});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('data'),
          ),
          body: StoreConnector<AppState, List<User>>(
            converter: (store) => store.state.users,
            builder: (context, List<User> users) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetail(
                              userId: users[index].id,
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Image.network(users[index].avatar),
                        ),
                        title: Text(
                          "${users[index].first_name} ${users[index].last_name}",
                        ),
                        subtitle: Text(users[index].email),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
