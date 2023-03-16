import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static Future<bool> requestPermission(Permission permission) async {
    final status = await permission.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      return await openAppSettingsForPermission(permission);
    } else {
      return await permission.request().isGranted;
    }
  }

  static Future<bool> openAppSettingsForPermission(
      Permission permission) async {
    final result = await openAppSettings();
    if (result) {
      final newStatus = await permission.status;
      return newStatus.isGranted;
    } else {
      return false;
    }
  }
}

class PermissionUtils {
  static Future requestAllPermission() async {
    Map<Permission, PermissionStatus> permission = await [
      // Permission.camera,
      // Permission.photos,
      // Permission.speech,
      Permission.storage,
      // Permission.location,
      // Permission.phone,
      // Permission.notification,
    ].request();

    // if (await Permission.camera.isGranted) {
    //   print("相机权限申请通过");
    // } else {
    //   print("相机权限申请失败");
    // }

    // if (await Permission.photos.isGranted) {
    //   print("照片权限申请通过");
    // } else {
    //   print("照片权限申请失败");
    // }

    // if (await Permission.speech.isGranted) {
    //   print("语音权限申请通过");
    // } else {
    //   print("语音权限申请失败");
    // }

    if (await Permission.storage.isGranted) {
      print("文件权限申请通过");
    } else {
      requestStoragePermission();
    }
    //
    // if (await Permission.location.isGranted) {
    //   print("定位权限申请通过");
    // } else {
    //   print("定位权限申请失败");
    // }
    //
    // if (await Permission.phone.isGranted) {
    //   print("手机权限申请通过");
    // } else {
    //   print("手机权限申请失败");
    // }
    //
    // if (await Permission.notification.isGranted) {
    //   print("通知权限申请通过");
    // } else {
    //   print("通知权限申请失败");
    // }
  }

  // static Future requestCameraPermission() async {
  //   Map<Permission, PermissionStatus> permission = await [
  //     Permission.camera,
  //   ].request();
  //
  //   if (await Permission.camera.isGranted) {
  //     print("相机权限申请通过");
  //   } else {
  //     print("相机权限申请失败");
  //   }
  // }

  // static Future requestPhotosPermission() async {
  //   Map<Permission, PermissionStatus> permission = await [
  //     Permission.photos,
  //   ].request();
  //
  //   if (await Permission.photos.isGranted) {
  //     print("照片权限申请通过");
  //   } else {
  //     print("照片权限申请失败");
  //   }
  // }

  // static Future requestSpeechPermission() async {
  //   Map<Permission, PermissionStatus> permission = await [
  //     Permission.speech,
  //   ].request();
  //
  //
  //
  //   if (await Permission.speech.isGranted) {
  //     print("语音权限申请通过");
  //   } else {
  //     print("语音权限申请失败");
  //   }
  //
  // }

  static Future requestStoragePermission() async {
    Map<Permission, PermissionStatus> permission = await [
      Permission.storage,
    ].request();

    if (await Permission.storage.isGranted) {
      print("文件权限申请通过");
    } else {
      print("文件权限申请失败");
    }
  }
//
// static Future requestLocationPermission() async {
//   Map<Permission, PermissionStatus> permission = await [
//
//     Permission.location,
//   ].request();
//
//   if (await Permission.location.isGranted) {
//     print("定位权限申请通过");
//   } else {
//     print("定位权限申请失败");
//   }
//
// }
//
// static Future requestPhonePermission() async {
//   Map<Permission, PermissionStatus> permission = await [
//
//     Permission.phone,
//   ].request();
//
//   if (await Permission.phone.isGranted) {
//     print("手机权限申请通过");
//   } else {
//     print("手机权限申请失败");
//   }
//
// }
//
// static Future requestNotificationPermission() async {
//   Map<Permission, PermissionStatus> permission = await [
//
//     Permission.notification,
//   ].request();
//
//   if (await Permission.notification.isGranted) {
//     print("通知权限申请通过");
//   } else {
//     print("通知权限申请失败");
//   }
// }

}
