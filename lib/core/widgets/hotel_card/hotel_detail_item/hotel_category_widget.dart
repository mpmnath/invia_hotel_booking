import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';

class HotelCategoryWidget extends StatelessWidget {
  final int category;
  final String categoryType;
  const HotelCategoryWidget({
    super.key,
    required this.category,
    required this.categoryType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (int i = 0; i < category; i++) Icon(Icons.star_rounded),
        Gap(verySmallPadding),
        Icon(Icons.help_outline),
      ],
    );
  }
}
