import 'package:redux/redux.dart';
import 'package:redux_api/middleware/user_middleware.dart';
import 'package:redux_api/models/user_model.dart';
import 'package:redux_api/reducers/user_reducer.dart';

final store = Store<AppState>(
  rootReducer,
  initialState: AppState(
    users: [],
    singleUser:
        User(id: 0, email: '', avatar: '', first_name: '', last_name: ''),
  ),
  middleware: [thunkMiddleware],
);
