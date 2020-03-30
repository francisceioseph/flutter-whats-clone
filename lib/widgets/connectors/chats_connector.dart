import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';
import 'package:flutter_whats_clone/redux/view_models/chats_vm.dart';

class ChatsConnector extends StatelessWidget {
  final Widget Function(BuildContext, ChatsViewModel) builder;

  ChatsConnector({
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatsViewModel>(
      converter: (store) => ChatsViewModel.build(store),
      builder: this.builder,
    );
  }
}
