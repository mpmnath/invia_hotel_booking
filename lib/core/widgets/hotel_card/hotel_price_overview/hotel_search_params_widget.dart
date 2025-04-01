import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/extensions/best_offer_ext.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';

class HotelSearchParamsWidget extends StatelessWidget {
  final BestOffer bestOffer;
  const HotelSearchParamsWidget({super.key, required this.bestOffer});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.textTheme.bodySmall!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bestOffer.localizedDuration(context)),
          Text(
            bestOffer.roomTypeAndBoarding,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
          Text(bestOffer.localizedTravellerInfo(context)),
        ],
      ),
    );
  }
}
