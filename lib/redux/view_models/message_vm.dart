import 'package:async_redux/async_redux.dart';
import 'package:flutter_whats_clone/models/message.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';

class MessagesViewModel {
  final List<Message> messages;

  MessagesViewModel({this.messages});

  factory MessagesViewModel.build(
    Store<AppState> store,
    String chatId,
  ) {
    Map<String, List<Message>> messageGroup =
        store.state.messageState.messageGroup;

    return MessagesViewModel(
      messages: messageGroup[chatId] ?? [],
    );
  }
}
