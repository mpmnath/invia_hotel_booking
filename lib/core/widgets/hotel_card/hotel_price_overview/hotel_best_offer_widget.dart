import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_price_overview/hotel_price_widget.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_price_overview/hotel_search_params_widget.dart';

class HotelBestOffer extends StatelessWidget {
  final BestOffer bestOffer;
  const HotelBestOffer({super.key, required this.bestOffer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(flex: 3, child: HotelSearchParamsWidget(bestOffer: bestOffer)),
        Gap(normalPadding),
        Flexible(flex: 2, child: HotelPriceWidget(bestOffer: bestOffer)),
      ],
    );
  }
}
