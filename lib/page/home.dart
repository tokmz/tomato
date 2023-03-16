import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widget/animated.dart';
import '../widget/indicator.dart';
import 'comic/featured.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List title = ["精选", "更新"];
  Color otherTab = Colors.white;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: title.length, vsync: this);
    _tabController.addListener(_setTabBarColor);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.removeListener(_setTabBarColor);
    _tabController.dispose();
  }

  void _setTabBarColor() {
    if (_tabController.index != 0) {
      setState(() {
        otherTab = Colors.black;
      });
    } else {
      setState(() {
        otherTab = Colors.white;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              ListView(
                children: const [
                  FeaturedView(),
                ],
              ),
              Center(
                child: Text("2"),
              )
              // Center(
              //   child: Text("3"),
              // ),
              // Center(
              //   child: Text("4"),
              // ),
            ],
          ),
          Container(
            color: Colors.transparent,
            height: 80,
            child: AppBar(
              backgroundColor: Colors.transparent,
              // toolbarHeight: 0,
              // 将 AppBar 的高度设置为 0
              elevation: 0,
              title: TabBar(
                controller: _tabController,

                indicator: CustomTabIndicatora(),

                //设置为可滑动
                isScrollable: true,

                // labelColor: Colors.blue.withOpacity(0.5),

                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
                unselectedLabelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),

                tabs: title
                    .map((e) => Tab(
                          child: Text(
                            e,
                            style: TextStyle(color: otherTab),
                          ),
                        ))
                    .toList(),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
          )
        ],
      ),
    );
  }
}
