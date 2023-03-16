import 'package:get/get.dart';

import '../page/comic/featured.dart';
import '../page/home.dart';

abstract class AppPages {
  static final List<GetPage> getPages = [
    GetPage(name: App.FEATURE, page: () => const FeaturedView()),
    GetPage(name: App.HOME, page: () => const HomeView()),
  ];
}

abstract class App {
  static const HOME = "/home";
  static const FEATURE = "/feature";
}
