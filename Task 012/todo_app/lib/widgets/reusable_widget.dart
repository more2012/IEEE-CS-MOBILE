import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

/// bottom bar item
BottomBarItem bottomBarItem({required IconData icon, required String text}) =>
    BottomBarItem(
      inActiveItem: Icon(icon, color: Colors.black),
      activeItem: Icon(icon, color: Colors.green),
      itemLabelWidget: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );

/// text form field

Widget defaultTextFormField({
  required TextEditingController controller,
  required String labelText,
  required IconData icon,
  required GestureTapCallback onTap,
}) => TextFormField(
  controller: controller,
  validator: (value) {
    if (value!.isEmpty) {
      return 'Please enter task name';
    }
    return null;
  },
  onTap: onTap,
  decoration: InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    prefixIcon: Icon(icon),
    labelText: labelText,
  ),
);
