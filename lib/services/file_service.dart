import 'dart:io';

import 'package:flutter_whats_clone/services/permission_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  PermissionService _permissionService = PermissionService();

  Future<Directory> getPictureDirectory() async {
    final permission = await _permissionService.requesStoragePermission();

    if (permission) {
      return _picturesDirectory;
    }

    return getTemporaryDirectory();
  }

  Future<Directory> get _picturesDirectory async {
    final Directory rootDir = await getExternalStorageDirectory();
    final Directory externalDir = _removeDataDirectory(rootDir.path);

    final whatsDir = Directory(
      join('${externalDir.path}', 'Pictures', 'WhatsClone'),
    );

    final whatsDirExists = await whatsDir.exists();

    if (!whatsDirExists) {
      await whatsDir.create();
    }

    return whatsDir;
  }

  Directory _removeDataDirectory(String path) {
    return Directory(path.split("Android")[0]);
  }
}
