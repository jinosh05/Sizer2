part of "sizer.dart";

/// A utility class for managing device properties and responsiveness.
class SizerUtil {
  SizerUtil._(); // Private constructor to prevent instantiation.

  // Device properties
  static late BoxConstraints boxConstraints;
  static late DeviceType deviceType;
  static late double height;
  static late Orientation orientation;
  static late double ratio;
  static late double width;

  /// Initializes device properties based on provided constraints,
  /// orientation, and context.
  static void init(
    BoxConstraints constraints,
    Orientation currentOrientation,
    BuildContext context,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    width = orientation == Orientation.portrait
        ? boxConstraints.maxWidth
        : boxConstraints.maxHeight;
    height = orientation == Orientation.portrait
        ? boxConstraints.maxHeight
        : boxConstraints.maxWidth;
    ratio = width / height;

    final double pixelDensity = MediaQuery.of(context).devicePixelRatio;
    ratio = ratio + ((pixelDensity + ratio) / 2);

    // Determine the device type
    deviceType = _getDeviceType();
  }

  /// Private method to determine the device type based on platform
  /// and screen size.
  static DeviceType _getDeviceType() {
    if (kIsWeb) {
      return DeviceType.web;
    } else if (Platform.isAndroid || Platform.isIOS) {
      return (orientation == Orientation.portrait && width < 600) ||
              (orientation == Orientation.landscape && height < 600)
          ? DeviceType.mobile
          : DeviceType.tablet;
    } else if (Platform.isMacOS) {
      return DeviceType.mac;
    } else if (Platform.isWindows) {
      return DeviceType.windows;
    } else if (Platform.isLinux) {
      return DeviceType.linux;
    } else {
      return DeviceType.fuchsia;
    }
  }

  /// Get a responsive size for the web based on screen width.
  static dynamic getWebResponsiveSize({
    required double smallSize,
    required double mediumSize,
    required double largeSize,
  }) =>
      width < 600
          ? smallSize // Phone
          : width <= 1024
              ? mediumSize // Tablet
              : largeSize; // Desktop
}

/// Enum to represent the type of device.
enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }
