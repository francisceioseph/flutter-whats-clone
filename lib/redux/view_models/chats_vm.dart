import 'package:async_redux/async_redux.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';

class ChatsViewModel {
  final Map<String, List<dynamic>> chats;

  ChatsViewModel({this.chats});

  factory ChatsViewModel.build(Store<AppState> store) {
    Map<String, List<dynamic>> chats = store.state.chatState.chats;

    return ChatsViewModel(
      chats: chats,
    );
  }
}
