import 'package:flutter/material.dart';

Color fromHex(String hexString) {
  hexString = hexString.replaceAll("#", "");
  if (hexString.length == 6) {
    hexString = "FF" + hexString;
    return Color(int.parse("0x$hexString"));
  } else if (hexString.length == 8) {
    return Color(int.parse("0x$hexString"));
  } else {
    return Color(int.parse("0xFF000000"));
  }
}
