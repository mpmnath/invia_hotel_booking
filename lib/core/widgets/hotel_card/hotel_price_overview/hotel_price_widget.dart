import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/extensions/best_offer_ext.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';

class HotelPriceWidget extends StatelessWidget {
  final BestOffer bestOffer;
  const HotelPriceWidget({super.key, required this.bestOffer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FittedBox(
          child: RichText(
            text: TextSpan(
              text: '${context.l10n.from} ',
              style: context.textTheme.bodySmall!.copyWith(
                color: context.primaryTextColor,
              ),
              children: [
                TextSpan(
                  text: bestOffer.totalPriceInEuros,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: context.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          bestOffer.pricePerPersonInEuros,
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}
