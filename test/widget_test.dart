import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            // set the status bar to use light colors on this page only
            value: SystemUiOverlayStyle.light,
            child: CustomScrollView(slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: AppBarSliverPersistentHeaderDelegate(
                  systemSafeAreaInsetTop: 0,
                  builder: (context, _, __, ___, _____, ____) {
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
            ]),

            // Theme(
            //   data: darkTheme,
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         height: 120,
            //         left: 0,
            //         right: 0,
            //         child: Container(
            //           decoration: const BoxDecoration(
            //             gradient: LinearGradient(
            //               begin: Alignment.topRight,
            //               end: Alignment.bottomLeft,
            //               colors: [
            //                 Color.fromRGBO(255, 221, 0, 1),
            //                 Color.fromRGBO(246, 178, 34, 1),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       Align(
            //         alignment: Alignment.topCenter,
            //         child: AppBar(
            //           backgroundColor: Colors.transparent,
            //           systemOverlayStyle: SystemUiOverlayStyle.light,
            //         ),
            //       ),
            //     ],
            //   ),
          ),
        ),
      ),
    );

    expect(find.byType(Scaffold), matchesGoldenFile("gradient.png"));
  });
}

final ThemeData darkTheme = ThemeData(
  appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: false,
        brightness: Brightness.dark,
      ),
);

typedef AppBarSliverPersistentHeaderBuilder = Widget Function(
  BuildContext context,
  double shrinkOffset,
  bool overlapsContent,
  double minExtent,
  double maxExtent,
  double progress,
);

class AppBarSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  AppBarSliverPersistentHeaderDelegate({
    required this.systemSafeAreaInsetTop,
    required this.builder,
    required this.maxHeight,
    required this.minHeight,
  });

  // The top inset into which no content should be draw as it might be obstructed by system UI or hardware (notch)
  final double systemSafeAreaInsetTop;
  final AppBarSliverPersistentHeaderBuilder builder;
  final double maxHeight;
  final double minHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // The collapse progress from 0 (initial fully expanded) to 1 (header is at its smallest state)
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0, 1).toDouble();
    return builder(context, shrinkOffset, overlapsContent, minExtent, maxExtent, progress);
  }

  @override
  double get maxExtent => maxHeight + systemSafeAreaInsetTop;

  @override
  double get minExtent => minHeight + systemSafeAreaInsetTop;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
