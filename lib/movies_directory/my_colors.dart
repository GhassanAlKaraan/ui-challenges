import 'dart:ui';

class MyColors {
  static Color primary = HexColor.fromHex("#111111");
  static Color secondary = HexColor.fromHex("#FFC700");
  static Color card = HexColor.fromHex("#424242");
  static Color primaryText = HexColor.fromHex("#FFFFFF");
  static Color secondaryText = HexColor.fromHex("#888888");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
