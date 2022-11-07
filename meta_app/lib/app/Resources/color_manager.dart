import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#538719');
  static Color topPrimary = HexColor.fromHex('#72B821');
  static Color bottomPrimary = HexColor.fromHex('#4E7E17');
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color grey = HexColor.fromHex('#737477');
  static Color lightGrey = HexColor.fromHex('#9E9E9E');
  static Color lightGreen = HexColor.fromHex('#9BE84B');
  static Color primaryOpacity70 = HexColor.fromHex('#B3ED9728');

  //  new colors
  static Color darkPrimary = HexColor.fromHex('#d17d11');
  static Color dark = HexColor.fromHex('#000000');
  static Color grey1 = HexColor.fromHex('#707070');
  static Color grey2 = HexColor.fromHex('#797979');
  static Color bodyLight = HexColor.fromHex('#9FD560');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#e61f34');
  static Color onboardingtitleColor = HexColor.fromHex('#525252');
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    hexString = hexString.replaceAll('#', '');
    if (hexString.length == 6) {
      hexString = 'ff' + hexString;
    }
    return Color(int.parse(hexString, radix: 16));
  }
}
