import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';
import 'package:flutter_whats_clone/redux/view_models/message_vm.dart';

class MessagesProvider extends StatelessWidget {
  final String chatId;
  final Widget Function(BuildContext, MessagesViewModel) builder;

  MessagesProvider({
    @required this.chatId,
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MessagesViewModel>(
      converter: (store) => MessagesViewModel.build(store, chatId),
      builder: this.builder,
    );
  }
}
