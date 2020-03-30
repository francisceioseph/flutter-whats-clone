import 'dart:io';

import 'package:flutter_whats_clone/services/permission_service.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  PermissionService _permissionService = PermissionService();

  Future<String> get imagePath async {
    final tempDir = await _getAppDataSubDirectory('Pictures');
    final imagePath = join(
      tempDir.path,
      'IMG_${DateTime.now().toIso8601String()}.png',
    );

    return imagePath;
  }

  Future<String> get videoPath async {
    final tempDir = await _getAppDataSubDirectory('Videos');
    final imagePath = join(
      tempDir.path,
      'VID_${DateTime.now().toIso8601String()}.mp4',
    );

    return imagePath;
  }

  Future<String> get audioPath async {
    Directory dir = await _getAppDataSubDirectory('Audios');

    String path = join(
      dir.path,
      'AUD_${DateTime.now().toIso8601String()}.mp4',
    );

    return path;
  }

  Future<Directory> get _appRootDirectory async {
    final Directory rootDir = await getExternalStorageDirectory();
    final Directory externalDir = _removeDataDirectory(rootDir.path);

    final whatsDir = Directory(
      join('${externalDir.path}', 'WhatsClone'),
    );

    final whatsDirExists = await whatsDir.exists();

    if (!whatsDirExists) {
      await whatsDir.create();
    }

    return whatsDir;
  }

  Future<Directory> get _appDataDirectory async {
    final permission = await _permissionService.requesStoragePermission();

    if (permission) {
      return _appRootDirectory;
    }

    return getTemporaryDirectory();
  }

  Future<Directory> _getAppDataSubDirectory(String dirName) async {
    final root = await _appDataDirectory;
    final subDir = Directory(
      join(root.path, dirName),
    );

    final exists = await subDir.exists();

    if (!exists) {
      await subDir.create();
    }

    return subDir;
  }

  Directory _removeDataDirectory(String path) {
    return Directory(path.split("Android")[0]);
  }
}
