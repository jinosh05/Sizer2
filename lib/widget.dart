part of "sizer.dart";

/// A typedef for the builder function that receives device information.
///
/// This typedef is used to define a function signature for the `builder`
/// property of the [Sizer] widget. It takes three parameters:
/// - `BuildContext context`: The build context of the widget.
/// - `Orientation orientation`: The current screen orientation (portrait or
///   landscape).
/// - `DeviceType deviceType`: The type of device (e.g., mobile, tablet,
///   desktop).
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

/// A widget that provides device information to its builder function.
///
/// This widget is designed to be wrapped around the MaterialApp in your Flutter
/// app. It offers details about the device's orientation and constraints to
/// help you create responsive UIs.
class Sizer extends StatelessWidget {
  /// Creates a [Sizer] widget.
  ///
  /// The [builder] parameter is required and should be a function that takes
  /// three parameters: a [BuildContext], an [Orientation], and a [DeviceType].
  const Sizer({
    required this.builder,
    Key? key,
  }) : super(key: key);

  /// The builder function that receives device information.
  ///
  /// This function is called whenever the orientation of the device changes.
  /// It should return a widget based on the provided context, orientation, and
  /// device type.
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            // Set the screen size and device type using the SizerUtil class.
            SizerUtil.init(constraints, orientation, context);

            // Call the builder function with the context,
            // orientation, and device type.
            return builder(context, orientation, SizerUtil.deviceType);
          },
        ),
      );
}
