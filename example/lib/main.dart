import 'package:flutter/material.dart';
import 'package:flutter_resizer/flutter_resizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      home: Scaffold(
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
              20.height, // Use 20.height instead of SizedBox(height: 20.h)
              if (SizeConfig.isSmallScreen)
                const Text('This is a small screen'),
              if (SizeConfig.isMediumScreen)
                const Text('This is a medium screen'),
              if (SizeConfig.isLargeScreen)
                const Text('This is a large screen'),
            ],
          ),
        ),
      ),
    );
  }
}
