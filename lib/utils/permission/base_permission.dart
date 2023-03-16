import 'package:permission_handler/permission_handler.dart';
import 'package:tomato/utils/permission/permission.dart';

import '../../widget/permission_widget.dart';

void storagePermission() async {
  bool granted = await PermissionManager.requestPermission(Permission.storage);
  if (granted) {
    // 权限已经被授予，可以执行相应操作
  } else {
    print("权限被拒绝");
    // 权限被拒绝，需要提示用户授权
  }
}


//判断是否有权限
void checkPermission() async {
  Permission permission = Permission.locationAlways;
  PermissionStatus status = await permission.status;
  print('检测权限$status');
  if (status.isGranted) {
    //权限通过
  }  else if (status.isPermanentlyDenied) {
    //权限永久拒绝，且不在提示，需要进入设置界面
    openAppSettings();
  } else if (status.isRestricted) {
    //活动限制（例如，设置了家长///控件，仅在iOS以上受支持。
    openAppSettings();
  } else {
    //第一次申请
    const PermissionWidget();

  }
}