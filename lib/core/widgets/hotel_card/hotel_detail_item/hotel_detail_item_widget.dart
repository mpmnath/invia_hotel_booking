import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_detail_item/hotel_category_widget.dart';

class HotelDetailItemWidget extends StatelessWidget {
  final Hotel hotel;
  const HotelDetailItemWidget({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelCategoryWidget(
          category: hotel.category,
          categoryType: hotel.categoryType,
        ),
        Gap(verySmallPadding),
        Text(
          hotel.name,
          style: context.textTheme.titleSmall!.copyWith(
            color: context.primaryTextColor,
          ),
        ),
        Gap(verySmallPadding / 2),
        Text(hotel.destination, style: context.textTheme.bodyMedium),
      ],
    );
  }
}
