import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Theme(
            data: darkTheme,
            child: Stack(
              children: [
                Positioned(
                  height: 120,
                  left: 0,
                  right: 0,
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
                Align(
                  alignment: Alignment.topCenter,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    systemOverlayStyle: SystemUiOverlayStyle.light,
                  ),
                ),
              ],
            ),
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
