import 'package:tomato/conf/api_conf.dart';
import 'package:tomato/utils/http/dio.dart';
import 'package:tomato/utils/sign.dart';

void main() {
  getCs();
}

void getCs() async {
  final dioClient = DioClient();
  var resp =
      await dioClient.get(ApiUri.CS, queryParameters: {"sign": createSign()});
  print(resp);
}
