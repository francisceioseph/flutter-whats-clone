import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_whats_clone/redux/state/app_state.dart';

class AddFilePath extends ReduxAction<AppState> {
  final String filePath;

  AddFilePath({@required this.filePath});

  AppState reduce() {
    final state = store.state.cameraMiniaturesState;
    final newState = state.copy(
      images: [...state.images, File(filePath)],
    );

    return store.state.copy(cameraMiniaturesState: newState);
  }
}

class DisposeFilePaths extends ReduxAction<AppState> {
  AppState reduce() {
    final state = store.state.cameraMiniaturesState;
    final newState = state.copy(images: []);

    return store.state.copy(cameraMiniaturesState: newState);
  }
}
