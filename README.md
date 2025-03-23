# Flutter Resizer

A Flutter package for responsive design that simplifies handling screen sizes, orientations, and responsive layouts.

---

## Features

- **Responsive Sizing**: Easily set widths, heights, and font sizes that scale with the screen size.
- **Screen Size Breakpoints**: Detect small, medium, and large screens.
- **Orientation Detection**: Check if the device is in portrait or landscape mode.
- **Custom Design Size**: Define a custom design size (e.g., 375x812) for consistent scaling across devices.

---

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_resizer: ^1.0.0
```

### Then run:
```shell
flutter pub get
```

# Usage
## 1. Initialize SizeConfig
    Call SizeConfig.init in your app's root widget:

```dart
import 'package:flutter_resizer/flutter_resizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context, customDesignWidth: 375, customDesignHeight: 812);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100.w, // 100 units based on design width
                height: 50.h, // 50 units based on design height
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Hello',
                    style: TextStyle(fontSize: 16.sp), // Font size scaled
                  ),
                ),
              ),
              20.height, // Responsive SizedBox height
              if (SizeConfig.isSmallScreen)
                Text('This is a small screen'),
              if (SizeConfig.isMediumScreen)
                Text('This is a medium screen'),
              if (SizeConfig.isLargeScreen)
                Text('This is a large screen'),
            ],
          ),
        ),
      ),
    );
  }
}
```

## 2. Use Responsive Extensions

* Width: Use **.w** for responsive width.
* Height: Use **.h** for responsive height.
* Font Size: Use **.sp** for responsive font size.
* SizedBox: Use **.height** and .width for responsive spacing.

### **Example:**

```dart
Container(
  width: 100.w, // 100 units based on design width
  height: 50.h, // 50 units based on design height
  child: Text(
    'Hello',
    style: TextStyle(fontSize: 16.sp), // Font size scaled
  ),
),

SizedBox(height: 20.h), or 20.height  // Responsive spacing
```

### 3. Screen Size Breakpoints

Detect screen sizes using:

* SizeConfig.isSmallScreen
* SizeConfig.isMediumScreen
* SizeConfig.isLargeScreen

#### **Example:**

```dart
if (SizeConfig.isSmallScreen)
  Text('This is a small screen'),
if (SizeConfig.isMediumScreen)
  Text('This is a medium screen'),
if (SizeConfig.isLargeScreen)
  Text('This is a large screen'),
```

### 4. Orientation Detection

Check the device orientation using:

* SizeConfig.isPortrait
* SizeConfig.isLandscape

#### **Example:**

```dart
if (SizeConfig.isPortrait)
  Text('Portrait mode'),
if (SizeConfig.isLandscape)
  Text('Landscape mode'),
```

Example
Check out the example for a complete usage example.
## API Reference

### `SizeConfig`

| Method/Property          | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| `init(context, {customDesignWidth, customDesignHeight})` | Initializes `SizeConfig` with the current context and optional design size. |
| `responsiveWidth(width)`  | Returns a responsive width based on the design size.                        |
| `responsiveHeight(height)`| Returns a responsive height based on the design size.                       |
| `responsiveFont(fontSize, {ignoreTextScaling})` | Returns a responsive font size based on the design size.                   |
| `toDp(value, {ignoreTextScaling})` | Converts a value to density-independent pixels (dp).                      |
| `aspectRatio`             | Returns the screen's aspect ratio (width / height).                         |
| `isSmallScreen`           | Returns `true` if the screen width is less than `smallScreenWidth`.         |
| `isMediumScreen`          | Returns `true` if the screen width is between `smallScreenWidth` and `largeScreenWidth`. |
| `isLargeScreen`           | Returns `true` if the screen width is greater than or equal to `largeScreenWidth`. |
| `isPortrait`              | Returns `true` if the device is in portrait mode.                          |
| `isLandscape`             | Returns `true` if the device is in landscape mode.                         |

### Extension Methods

| Extension | Description                        |
|-----------|------------------------------------|
| `.w`      | Responsive width (e.g., `100.w`).  |
| `.h`      | Responsive height (e.g., `50.h`).  |
| `.sp`     | Responsive font size (e.g., `16.sp`). |
| `.dp`     | Density-independent pixels (e.g., `10.dp`). |
| `.height` | Responsive `SizedBox` height (e.g., `20.height`). |
| `.width`  | Responsive `SizedBox` width (e.g., `20.width`). |