import 'package:async_redux/async_redux.dart';
import 'package:flutter_whats_clone/models/message.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';
import 'package:flutter_whats_clone/redux/state/messages_state.dart';
import 'package:flutter_whats_clone/repositories/messages_repository.dart';

class LoadMessages extends ReduxAction<AppState> {
  final String chatId;
  final MessagesRepository _repository = MessagesRepository();

  LoadMessages({this.chatId});

  Future<AppState> reduce() async {
    try {
      final messages = await _repository.loadMessages(
        chatId: chatId,
      );

      final messageGroup = store.state.messageState.messageGroup;
      final Map<String, List<Message>> newMessageGroup = {
        ...messageGroup,
        '$chatId': messages
      };

      store.dispatch(LoadMessagesSuccess(messageGroup: newMessageGroup));
    } catch (e) {
      print('error');
    }
    return null;
  }
}

class LoadMessagesSuccess extends ReduxAction<AppState> {
  final Map<String, List<Message>> messageGroup;

  LoadMessagesSuccess({this.messageGroup});

  AppState reduce() {
    final MessageState messageState = store.state.messageState.copy(
      messageGroup: messageGroup,
    );

    return store.state.copy(messageState: messageState);
  }
}
