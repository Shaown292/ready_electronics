 import 'package:flutter/material.dart';

const MaterialColor custom = MaterialColor(_customPrimaryValue, <int, Color>{
  50: Color(0xFFE3F6F8),
  100: Color(0xFFB8E7EC),
  200: Color(0xFF89D8E0),
  300: Color(0xFF5AC8D4),
  400: Color(0xFF36BCCA),
  500: Color(_customPrimaryValue),
  600: Color(0xFF11A9BB),
  700: Color(0xFF0EA0B3),
  800: Color(0xFF0B97AB),
  900: Color(0xFF06879E),
});
 const int _customPrimaryValue = 0xFF13B0C1;

 const MaterialColor customAccent = MaterialColor(_customAccentValue, <int, Color>{
  100: Color(0xFFCAF6FF),
  200: Color(_customAccentValue),
  400: Color(0xFF64E4FF),
  700: Color(0xFF4AE0FF),
});
const int _customAccentValue = 0xFF97EDFF;