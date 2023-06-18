part of sizer;

extension SizerExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * SizerUtil.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * SizerUtil.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (SizerUtil.width / 3) / 100;

  /// Calculates the font depending on the device's screen size
  ///
  /// Eg: 8.f -. will give responsive 8 font size
  double get f => (SizerUtil.ratio * this * 0.125) + this * 1.90;
}
