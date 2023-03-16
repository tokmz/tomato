import 'package:flutter/material.dart';


class CustomTabIndicatora extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicatora decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint();
    paint.color = Colors.redAccent;
    paint.style = PaintingStyle.fill;

    final Rect rect = offset & configuration.size!;
    final double indicatorHeight = 6;
    final Rect indicator = Rect.fromLTWH(
      offset.dx,
      offset.dy + rect.height - indicatorHeight,
      rect.width,
      indicatorHeight,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(indicator, Radius.circular(indicatorHeight / 2)),
      paint,
    );
  }
}
//
//
//
//
// import 'package:flutter/material.dart';
// import 'dart:ui';
//
// class CustomTabIndicator extends Decoration {
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _CustomPainter(this, onChanged);
//   }
// }
//
// class _CustomPainter extends BoxPainter {
//   final CustomTabIndicator decoration;
//
//   _CustomPainter(this.decoration, VoidCallback? onChanged)
//       : super(onChanged);
//
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     final paint = Paint();
//     paint.color = Colors.black;
//     paint.style = PaintingStyle.fill;
//
//     final Rect rect = offset & configuration.size!;
//     const double indicatorHeight = 6;
//     const double indicatorWidth = 60; // 指示器的宽度
//     const double originalWidth = 15; // 初始宽度
//     final double midPoint = (rect.width / 2) - (indicatorWidth / 2);
//     final double endPosition = rect.width - indicatorWidth;
//     double currentWidth = originalWidth;
//
//     // 计算指示器的位置和宽度
//     if (configuration.position != null && configuration.previousPosition != null) {
//       final double currentPosition = configuration.position!.dx;
//       final double previousPosition = configuration.previousPosition!.dx;
//
//       if (currentPosition > previousPosition) {
//         // 向右滑动
//         if (currentPosition >= midPoint && currentPosition <= endPosition) {
//           // 在指定范围内放大
//           currentWidth = (currentPosition - midPoint) * (indicatorWidth - originalWidth) / (endPosition - midPoint) + originalWidth;
//         } else if (currentPosition > endPosition) {
//           // 超出指定范围缩小
//           currentWidth = (endPosition - midPoint) * (indicatorWidth - originalWidth) / (endPosition - midPoint) + originalWidth;
//         }
//       } else {
//         // 向左滑动
//         if (currentPosition >= midPoint && currentPosition <= endPosition) {
//           // 在指定范围内缩小
//           currentWidth = (endPosition - currentPosition) * (indicatorWidth - originalWidth) / (endPosition - midPoint) + originalWidth;
//         } else if (currentPosition < midPoint) {
//           // 超出指定范围放大
//           currentWidth = (endPosition - midPoint) * (indicatorWidth - originalWidth) / (endPosition - midPoint) + originalWidth;
//         }
//       }
//     }
//
//     final Rect indicator = Rect.fromLTWH(
//       offset.dx + midPoint,
//       offset.dy + rect.height - indicatorHeight,
//       currentWidth,
//       indicatorHeight,
//     );
//     canvas.drawRRect(
//       RRect.fromRectAndRadius(indicator, const Radius.circular(indicatorHeight / 2)),
//       paint,
//     );
//   }
// }