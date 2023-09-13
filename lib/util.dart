part of sizer_pro;

class SizerUtil {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

  /// Device's Height
  static late double height;

  /// Device's Orientation
  static late Orientation orientation;

  /// Device's Width
  static late double ratio;

  /// Device's Width
  static late double width;

  /// Sets the Screen's size and Device's Orientation,
  /// BoxConstraints, Height, and Width
  static void setScreenSize(BoxConstraints constraints,
      Orientation currentOrientation, BuildContext context) {
    // Sets boxconstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Sets screen width and height
    if (orientation == Orientation.portrait ||
        !(Platform.isAndroid || Platform.isIOS)) {
      width = boxConstraints.maxWidth;
      height = boxConstraints.maxHeight;
    } else {
      width = boxConstraints.maxHeight;
      height = boxConstraints.maxWidth;
    }

    log("Width $width  Height $height");

    ratio = width / height;
    double pixelDensity = MediaQuery.of(context).devicePixelRatio;
    ratio = (ratio) + ((pixelDensity + ratio) / 2);

    // Sets ScreenType
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else if (Platform.isAndroid || Platform.isIOS) {
      if (width < 600) {
        deviceType = DeviceType.mobile;
      } else {
        deviceType = DeviceType.tablet;
      }
    } else if (Platform.isMacOS) {
      deviceType = DeviceType.mac;
    } else if (Platform.isWindows) {
      deviceType = DeviceType.windows;
    } else if (Platform.isLinux) {
      deviceType = DeviceType.linux;
    } else {
      deviceType = DeviceType.fuchsia;
    }
  }

  //for responsive web
  static getWebResponsiveSize({smallSize, mediumSize, largeSize}) {
    return width < 600
        ? smallSize //'phone'
        : width >= 600 && width <= 1024
            ? mediumSize //'tablet'
            : largeSize; //'desktop';
  }
}

/// Type of Device
///
/// This can be either mobile or tablet
enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }
