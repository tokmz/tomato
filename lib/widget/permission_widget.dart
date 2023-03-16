import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tomato/utils/permission/base_permission.dart';

class PermissionWidget extends StatelessWidget {
  const PermissionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('文件存储权限'),
      content: const Text('We need your permission to access'),
      actions: [
        TextButton(
          onPressed: () async {
            exit(0);
          },
          child: const Text('拒绝'),
        ),
        TextButton(
          onPressed: () async {
            storagePermission();
          },
          child: const Text('同意'),
        ),
      ],
    );
  }
}
