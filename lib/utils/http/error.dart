import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void dioError(dynamic e) {
  if (e.type == DioErrorType.connectionTimeout ||
      e.type == DioErrorType.receiveTimeout ||
      e.type == DioErrorType.sendTimeout) {
    // 请求超时
    showAlertDialog('请求超时，请检查网络连接后重试');
  } else if (e.type == DioErrorType.badResponse) {
    // 服务器返回了错误状态码
    switch (e.response!.statusCode) {
      case 404:
        showAlertDialog('未找到该相关信息');
        break;
      case 201:
        showAlertDialog('注册失败');
        break;
      case 202:
        showAlertDialog('账号已存在');
        break;
      case 203:
        showAlertDialog('账号不存在');
        break;
      case 204:
        showAlertDialog('更新失败');
        break;
      case 206:
        showAlertDialog('登录失败');
        break;
      case 207:
        showAlertDialog('密码错误');
        break;
      case 211:
        showAlertDialog('获取失败');
        break;
      case 500:
        showAlertDialog('数据异常');
        break;
      case 501:
        print("token 过期");
        // showAlertDialog('toke');
        break;
      case 502:
        print("长期没有登录");
        // showAlertDialog('toke');
        break;
      case 503:
        print("异地登录");
        // showAlertDialog('toke');
        break;
      // 其他错误状态码的处理
      default:
        showAlertDialog('服务器异常，请稍后重试');
        break;
    }
  } else if (e.type == DioErrorType.cancel) {
    // 请求被取消
    print('请求被取消');
  } else {
    // 其他网络错误
    showAlertDialog('网络错误，请检查网络连接后重试');
  }
}

void showAlertDialog(String message) {
  // 使用Flutter的AlertDialog组件来显示提示信息
  var context;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('提示'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('确定'),
          ),
        ],
      );
    },
  );
}
