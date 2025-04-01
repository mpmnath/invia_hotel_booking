import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';
import 'package:invia_hotel_booking/core/utils/rating_utils.dart';

class RatingOverallWidget extends StatelessWidget {
  final Rating rating;
  const RatingOverallWidget({super.key, required this.rating});

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
                  SentimentWidget(score: rating.score),
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

class SentimentWidget extends StatelessWidget {
  final double score;
  const SentimentWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Icon(
      RatingUtils.getSentimentIcon(score),
      color: Colors.white,
      size: 14,
      fill: 1.0,
    );
  }
}
