import 'package:async_redux/async_redux.dart';

import 'package:flutter_whats_clone/models/chat.dart';
import 'package:flutter_whats_clone/models/chat_group.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';
import 'package:flutter_whats_clone/repositories/chats_repository.dart';

class LoadChats extends ReduxAction<AppState> {
  final ChatsRepository _repository = ChatsRepository();

  Future<AppState> reduce() async {
    try {
      final res = await _repository.loadChats();
      final chats = res.map((c) => Chat.fromJson(c));

      final all = chats.where((c) => !c.pinned).toList();
      final pinned = chats.where((c) => c.pinned).toList();

      store.dispatch(LoadChatsSuccess(
        pinned: pinned,
        all: all,
      ));
    } catch (e) {}

    return null;
  }
}

class LoadChatsSuccess extends ReduxAction<AppState> {
  final List<Chat> pinned;
  final List<Chat> all;

  LoadChatsSuccess({
    this.pinned = const [],
    this.all = const [],
  });

  AppState reduce() {
    final appState = store.state;
    final chatState = appState.chatState.copy(
      chatGroup: ChatGroup(
        all: all,
        pinned: pinned,
      ),
    );

    return appState.copy(chatState: chatState);
  }
}

class LoadChatsError extends ReduxAction<AppState> {
  AppState reduce() {
    print('an error happened!!!');
    return null;
  }
}
