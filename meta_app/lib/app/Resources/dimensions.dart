import 'package:flutter/widgets.dart';

class Dimension {
  final BuildContext context;
  Dimension({required this.context});

  double getHeight(double convertHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    const figmaDesignHeight = 812;
    double newScreenHeight = figmaDesignHeight / convertHeight;
    return screenHeight / newScreenHeight;
  }

  double getWidth(double convertWidth) {
    final screenWidth = MediaQuery.of(context).size.width;
    const figmaDesignWidth = 375;
    double newScreenWidth = figmaDesignWidth / convertWidth;
    return screenWidth / newScreenWidth;
  }
}

extension getAppHeight on num {
  // convert height
  double appHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const figmaDesignHeight = 812;
    double newScreenHeight = figmaDesignHeight / this.toDouble();
    return screenHeight / newScreenHeight;
  }

  //  convert width
  double appWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const figmaDesignWidth = 375;
    double newScreenWidth = figmaDesignWidth / this.toDouble();
    return screenWidth / newScreenWidth;
  }
}
