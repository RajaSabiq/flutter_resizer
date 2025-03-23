import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_resizer/flutter_resizer.dart'; // Import your package

void main() {
  testWidgets('ResponsiveApp renders correctly and responds to size changes',
          (WidgetTester tester) async {
        // Build the app and trigger a frame
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                // Initialize SizeConfig with the current context
                SizeConfig.init(context, customDesignWidth: 375, customDesignHeight: 812);

                return Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100.w,
                          height: 50.h,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Hello',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        ),
                        20.height,
                        if (SizeConfig.isSmallScreen)
                          const Text('This is a small screen'),
                        if (SizeConfig.isMediumScreen)
                          const Text('This is a medium screen'),
                        if (SizeConfig.isLargeScreen)
                          const Text('This is a large screen'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );


        // Verify that the text has the correct responsive font size
        final text = find.text('Hello');
        final textWidget = tester.widget<Text>(text);
        expect(textWidget.style?.fontSize, 16.sp);

        // Verify that the SizedBox has the correct responsive height
        final sizedBox = find.byType(SizedBox).at(1); // The second SizedBox in the tree
        final sizedBoxWidget = tester.widget<SizedBox>(sizedBox);
        expect(sizedBoxWidget.height, 20.h);

        // Verify the screen size breakpoints
        final screenWidth = tester.binding.window.physicalSize.width;
        if (screenWidth < SizeConfig.smallScreenWidth) {
          expect(find.text('This is a small screen'), findsOneWidget);
        } else if (screenWidth >= SizeConfig.smallScreenWidth && screenWidth < SizeConfig.largeScreenWidth) {
          expect(find.text('This is a medium screen'), findsOneWidget);
        } else {
          expect(find.text('This is a large screen'), findsOneWidget);
        }
      });
}