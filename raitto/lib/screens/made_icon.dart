import 'package:flutter/material.dart';

class MadeIcon {
  final IconData iconData;
  final String name;

  MadeIcon(this.iconData, this.name);
}

List<MadeIcon> madeIcons = [
  MadeIcon(Icons.liquor_rounded, "술집"),
  MadeIcon(Icons.restaurant_rounded, "식당"),
  MadeIcon(Icons.coffee_rounded, "카페"),
  MadeIcon(Icons.sports_esports_rounded, "PC방"),
  MadeIcon(Icons.music_note_rounded, "노래방"),
  MadeIcon(Icons.sports_gymnastics_rounded, "헬스장"),
  MadeIcon(Icons.shopping_cart_rounded, "편의점/마트"),
  MadeIcon(Icons.menu_book_rounded, "책/문구"),
  MadeIcon(Icons.local_laundry_service_rounded, "빨래방"),
];
