import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:tomato/conf/set.dart';

int currentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String generateMd5(String input) {
  var bytes = utf8.encode(input);
  var digest = md5.convert(bytes);
  return digest.toString();
}

String createSign() {
  return generateMd5("${currentTimestamp()}${SysConfig.signKey}");
}
