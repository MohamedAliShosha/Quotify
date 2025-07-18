import 'package:flutter/material.dart';

BottomNavigationBarItem buildBottomNavBarItem(
    {required Widget icon, required String label}) {
  return BottomNavigationBarItem(
    icon: icon,
    label: label,
  );
}
