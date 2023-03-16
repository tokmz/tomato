import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FeaturedView extends StatefulWidget {
  const FeaturedView({Key? key}) : super(key: key);

  @override
  State<FeaturedView> createState() => _FeaturedViewState();
}

class _FeaturedViewState extends State<FeaturedView> {
  final List<String> imgList = [
    'https://pic.dmjnb.com/pic/fb803f9e848476306bac335c1073e0a0?imageMogr2/thumbnail/x380/quality/90!',
    'https://pic.dmjnb.com/pic/a99301f0e3784b2b8b66deec68dc31b3?imageMogr2/thumbnail/x380/quality/90!',
    'https://pic.dmjnb.com/pic/d6c58d364f58fae3ff8dd6d217ccca6d?imageMogr2/thumbnail/x380/quality/90!',
    'https://pic.dmjnb.com/pic/100dc4c31a4cfa4c6d3def642fb2efaf?imageMogr2/thumbnail/x380/quality/90!',
    'https://pic.dmjnb.com/pic/bf1ebc9f1ad393faf2a545cf834569ec?imageMogr2/thumbnail/x380/quality/90!',
  ];
  int picIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          // 背景层
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imgList[picIndex]), fit: BoxFit.cover)),
            // 高斯模糊
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          // 轮播图
          Container(
            height: 220,
            margin: const EdgeInsets.only(top: 70),
            child: CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (context, index, realIndex) {
                return Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(imgList[index]),
                                    fit: BoxFit.cover)),
                            width: double.infinity,
                          ),
                          Positioned(
                            bottom: 5,
                            left: 10,
                            child: Text(
                              "第$picIndex张图",
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Colors.white),
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Flex(
                            direction: Axis.vertical,
                            children: const [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "这是信息",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    picIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
