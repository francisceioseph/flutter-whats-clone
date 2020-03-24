import 'package:async_redux/async_redux.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';

final store = Store<AppState>(
  initialState: AppState.initial(),
);
