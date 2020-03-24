import 'package:async_redux/async_redux.dart';
import 'package:flutter_whats_clone/models/chat_group.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';

class ChatsViewModel {
  final ChatGroup chats;

  ChatsViewModel({this.chats});

  factory ChatsViewModel.build(Store<AppState> store) {
    ChatGroup chats = store.state.chatState.chatGroup;

    return ChatsViewModel(
      chats: chats,
    );
  }
}
