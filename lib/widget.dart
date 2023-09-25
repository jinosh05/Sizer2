part of sizer_pro;

/// Provides `Context`, `Orientation`, and `DeviceType` parameters to the builder function
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

/// A widget that gets the device's details like orientation and constraints
///
/// Usage: Wrap MaterialApp with this widget
class Sizer extends StatelessWidget {
  const Sizer({required this.builder, Key? key}) : super(key: key);

  /// Builds the widget whenever the orientation changes
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            SizerUtil.setScreenSize(constraints, orientation, context);
            return builder(context, orientation, SizerUtil.deviceType);
          },
        ),
      );
}
