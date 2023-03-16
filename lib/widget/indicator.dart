// import 'package:flutter/material.dart';
//
// class MyCustomIndicator extends Decoration {
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _MyCustomIndicatorPainter(this, onChanged);
//   }
// }
//
// class _MyCustomIndicatorPainter extends BoxPainter {
//   final MyCustomIndicator decoration;
//
//   _MyCustomIndicatorPainter(this.decoration, VoidCallback? onChanged)
//       : assert(decoration != null),
//         super(onChanged);
//
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     final Rect rect = offset & configuration.size!;
//     final Paint paint = Paint();
//     paint.color = Colors.red;
//
//     final double indicatorWidth = rect.width / configuration.tabs.length;
//     const double indicatorHeight = 5;
//
//     if (configuration.position != null && configuration.previousPosition != null) {
//       final double currentPosition = configuration.position!.dx;
//       final double previousPosition = configuration.previousPosition!.dx;
//
//       // 当前指示器的位置和宽度
//       final double indicatorLeft = offset.dx +
//           (currentPosition * indicatorWidth) +
//           ((indicatorWidth - 15) / 2);
//       final double indicatorWidthNow = 15 + (currentPosition - previousPosition).abs() * indicatorWidth;
//
//       // 绘制当前指示器
//       canvas.drawRRect(
//         RRect.fromRectAndRadius(
//           Rect.fromLTWH(
//             indicatorLeft,
//             rect.bottom - indicatorHeight,
//             indicatorWidthNow,
//             indicatorHeight,
//           ),
//           Radius.circular(indicatorHeight),
//         ),
//         paint,
//       );
//
//       // 绘制上一个指示器，用于实现指示器大小动态变化的效果
//       final double indicatorLeftPrev = offset.dx +
//           (previousPosition * indicatorWidth) +
//           ((indicatorWidth - 15) / 2);
//       final double indicatorWidthPrev = 15 + (previousPosition - currentPosition).abs() * indicatorWidth;
//
//       canvas.drawRRect(
//         RRect.fromRectAndRadius(
//           Rect.fromLTWH(
//             indicatorLeftPrev,
//             rect.bottom - indicatorHeight,
//             indicatorWidthPrev,
//             indicatorHeight,
//           ),
//           Radius.circular(indicatorHeight),
//         ),
//         paint,
//       );
//     } else {
//       // 在原始位置时将指示器的宽度设置为15像素
//       final double indicatorLeft = offset.dx + ((indicatorWidth - 15) / 2);
//       canvas.drawRRect(
//         RRect.fromRectAndRadius(
//           Rect.fromLTWH(
//             indicatorLeft,
//             rect.bottom - indicatorHeight,
//             15,
//             indicatorHeight,
//           ),
//           Radius.circular(indicatorHeight),
//         ),
//         paint,
//       );
//     }
//   }
// }