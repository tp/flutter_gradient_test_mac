import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: AppBarSliverPersistentHeaderDelegate(
                  builder: (_) {
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color.fromRGBO(255, 221, 0, 1),
                                  Color.fromRGBO(246, 178, 34, 1),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  maxHeight: 250,
                  minHeight: 65,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(Scaffold), matchesGoldenFile("gradient_${Platform.operatingSystem}.png"));
  });
}

class AppBarSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  AppBarSliverPersistentHeaderDelegate({
    required this.builder,
    required this.maxHeight,
    required this.minHeight,
  });

  final WidgetBuilder builder;
  final double maxHeight;
  final double minHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(context);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
