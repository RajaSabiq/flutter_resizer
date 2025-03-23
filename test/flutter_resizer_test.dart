import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_resizer/flutter_resizer.dart';

void main() {
  testWidgets('SizeConfig initializes correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            SizeConfig.init(context, customDesignWidth: 375, customDesignHeight: 812);

            // Verify that SizeConfig is initialized correctly
            expect(SizeConfig.screenWidth, greaterThan(0));
            expect(SizeConfig.screenHeight, greaterThan(0));
            expect(SizeConfig.screenWidthPercent, greaterThan(0));
            expect(SizeConfig.screenHeightPercent, greaterThan(0));
            expect(SizeConfig.pixelRatio, greaterThan(0));
            expect(SizeConfig.orientation, isNotNull);

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  });

  testWidgets('Responsive calculations return expected values', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            SizeConfig.init(context, customDesignWidth: 375, customDesignHeight: 812);

            // Simulate screen size
            SizeConfig.screenWidth = 400;
            SizeConfig.screenHeight = 800;

            // Verify responsive calculations
            expect(10.w, equals((10 / 375) * 400)); // 10% of design width (375) scaled to screen width (400)
            expect(10.h, equals((10 / 812) * 800)); // 10% of design height (812) scaled to screen height (800)
            expect(10.sp, equals((10 / 375) * 400)); // 10% of design width (375) scaled to screen width (400)

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  });

  testWidgets('Screen size breakpoints work correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            SizeConfig.init(context, customDesignWidth: 375, customDesignHeight: 812);

            // Test small screen
            SizeConfig.screenWidth = 300;
            expect(SizeConfig.isSmallScreen, isTrue);
            expect(SizeConfig.isMediumScreen, isFalse);
            expect(SizeConfig.isLargeScreen, isFalse);

            // Test medium screen
            SizeConfig.screenWidth = 600;
            expect(SizeConfig.isSmallScreen, isFalse);
            expect(SizeConfig.isMediumScreen, isTrue);
            expect(SizeConfig.isLargeScreen, isFalse);

            // Test large screen
            SizeConfig.screenWidth = 1000;
            expect(SizeConfig.isSmallScreen, isFalse);
            expect(SizeConfig.isMediumScreen, isFalse);
            expect(SizeConfig.isLargeScreen, isTrue);

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  });

  testWidgets('Orientation detection works correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            SizeConfig.init(context, customDesignWidth: 375, customDesignHeight: 812);

            // Simulate portrait orientation
            SizeConfig.orientation = Orientation.portrait;
            expect(SizeConfig.isPortrait, isTrue);
            expect(SizeConfig.isLandscape, isFalse);

            // Simulate landscape orientation
            SizeConfig.orientation = Orientation.landscape;
            expect(SizeConfig.isPortrait, isFalse);
            expect(SizeConfig.isLandscape, isTrue);

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  });
}