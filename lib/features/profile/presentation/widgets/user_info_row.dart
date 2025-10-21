import 'package:flutter/material.dart';
import 'package:starter_template/core/utils/colors_manager.dart';

Widget buildInfoRow(IconData icon, String label, String value) {
  return Row(
    children: [
      Icon(icon, color: ColorsManager.kBlack54Color),
      const SizedBox(width: 15),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: ColorsManager.kGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: ColorsManager.kBlack87Color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
