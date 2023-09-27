part of "sizer.dart";

/// Extension methods for numerical values to provide responsive sizing.
extension SizerExt on num {
  /// Calculates the height depending on the device's screen size.
  ///
  /// Example: `20.h` will take 20% of the screen's height.
  double get h => this * SizerUtil.height / 100;

  /// Calculates the width depending on the device's screen size.
  ///
  /// Example: `20.w` will take 20% of the screen's width.
  double get w => this * SizerUtil.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size.
  double get sp => (SizerUtil.ratio * this * 0.77) + this;

  /// Calculates the font size depending on the device's screen size.
  /// Can also be used for Icon size.
  ///
  /// Example: `8.f` will give a responsive font size of 8.
  double get f => (SizerUtil.ratio * this * 0.125) + this * 1.90;
}
