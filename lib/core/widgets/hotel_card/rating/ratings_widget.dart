import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';
import 'package:invia_hotel_booking/core/utils/rating_utils.dart';

class RatingsWidget extends StatelessWidget {
  final Rating rating;
  const RatingsWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(verySmallPadding),
      child: Row(
        children: [
          ColoredBox(
            color: RatingUtils.getSentimentColor(rating.score),
            child: Padding(
              padding: EdgeInsets.all(verySmallPadding),
              child: Row(
                children: [
                  Icon(
                    RatingUtils.getSentimentIcon(rating.score),
                    color: Colors.white,
                    size: 14,
                    fill: 1.0,
                  ),
                  const Gap(2),
                  Text(
                    '${rating.score} / 5.0',
                    style: context.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(smallPadding),
          Text(
            "${rating.scoreDescription}  (${rating.reviewsCount} Bew.)",
            style: context.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
