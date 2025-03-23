# flutter_resizer

A lightweight Flutter package for responsive UI scaling. `flutter_resizer` helps developers create adaptive layouts by providing a simple way to scale width, height, and font sizes based on screen dimensions.

## 🚀 Features
- Responsive width and height calculations
- Adaptive font scaling
- Easy-to-use extensions for `num`
- Density-independent pixel conversion (dp)

## 📦 Installation
Add the following dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_resizer: latest_version
```

Then, run:
```sh
flutter pub get
```

## 🛠 Usage

### 1️⃣ Initialize `SizeConfig`
You need to initialize `SizeConfig` inside your `build` method before using it.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_resizer/flutter_resizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Resizer Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Responsive Font Size",
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 50.w,
              height: 20.h,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                "Responsive Box",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 2️⃣ Responsive Sizing Extensions
`flutter_resizer` provides convenient extensions on `num`:

```dart
// Responsive height and width
Container(
  width: 50.w, // 50% of screen width
  height: 20.h, // 20% of screen height
);

// Responsive font size
Text("Adaptive Text", style: TextStyle(fontSize: 18.sp));

// Density-independent pixels (dp)
double valueInDp = 14.dp;
```

## 📝 API Reference
| Method | Description |
|--------|-------------|
| `SizeConfig.init(BuildContext context)` | Initializes the screen size and scaling values. |
| `.w` | Converts a number to a responsive width percentage. |
| `.h` | Converts a number to a responsive height percentage. |
| `.sp` | Converts a number to a responsive font size. |
| `.dp` | Converts a number to a density-independent pixel (dp). |

## 🛠 Running Tests
To verify the package, run:
```sh
flutter test
```

## 🏗 Contributing
Pull requests and contributions are welcome! Feel free to submit any issues or improvements.

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

