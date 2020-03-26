import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionHandler _permissionManager = PermissionHandler();

  Future<bool> requesStoragePermission() async {
    final permission =
        await _permissionManager.requestPermissions([PermissionGroup.storage]);

    if (permission[PermissionGroup.storage] == PermissionStatus.granted) {
      return true;
    }

    return false;
  }
}
