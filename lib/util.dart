part of "sizer.dart";

/// A utility class for managing device properties and responsiveness.
class SizerUtil {
  SizerUtil._(); // Private constructor to prevent instantiation.

  // Device properties

  /// The `BoxConstraints` representing the device's screen size.
  ///
  /// This property stores information about the minimum and maximum width
  /// and height that a widget can have. It is used for determining the device's
  /// screen constraints and is essential for responsive design calculations.
  static late BoxConstraints boxConstraints;

  /// The type of device running the application.
  ///
  /// This property is determined based on the platform
  /// (e.g., Android, iOS, web)
  /// and the screen size. It categorizes the device as mobile, tablet, web, or
  /// other platforms. It helps in making device-specific design decisions.
  static late DeviceType deviceType;

  /// The height of the device's screen.
  ///
  /// This property represents the height of the device's screen
  /// in logical pixels.It is calculated based on the device's orientation
  /// (portrait or landscape) and the `boxConstraints`.
  ///  The height is used for responsive design calculations.
  static late double height;

  /// The current orientation of the device.
  ///
  /// This property can have values
  /// `Orientation.portrait` or `Orientation.landscape`.
  /// It represents the physical orientation of the device
  /// and is used to adapt the
  /// user interface accordingly.
  static late Orientation orientation;

  /// The ratio of the device's width to its height.
  ///
  /// This property is calculated using the `width` and `height` properties and
  /// represents the aspect ratio of the device's screen. It can be used for
  /// various responsive design calculations.
  static late double ratio;

  /// The width of the device's screen.
  ///
  /// This property represents the width of the device's screen
  /// in logical pixels. Similar to the `height` property,
  /// it is calculated based on the device's orientation (portrait or landscape)
  /// and the `boxConstraints`.
  /// The width is used for responsive design calculations.
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
