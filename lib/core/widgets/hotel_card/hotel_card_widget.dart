import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/extensions/page_type_ext.dart';
import 'package:invia_hotel_booking/core/types/page_type.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/favorite_widget.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_details/hotel_details_widget.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_price_overview/hotel_best_offer_widget.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/image_carousel_widget.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/rating/ratings_widget.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final PageType pageType;

  const HotelCard({
    super.key,
    required this.hotel,
    required this.isFavorite,
    required this.onFavoriteToggle,
    this.pageType = PageType.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(bottom: normalPadding),
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(bottom: normalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    ImageCarouselWidget(
                      imageUrls: hotel.images.map((e) => e.small).toList(),
                    ),
                    Positioned(
                      top: 0,
                      right: 2,
                      child: FavoriteWidget(
                        isFavorite: isFavorite,
                        onTap: onFavoriteToggle,
                      ),
                    ),
                    if (hotel.rating != null)
                      Positioned(
                        bottom: 12,
                        left: 8,
                        child: RatingsWidget(rating: hotel.rating!),
                      ),
                  ],
                ),
                Gap(normalPadding),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: normalPadding),
                  child: Column(
                    children: [
                      HotelDetailsWidget(hotel: hotel),
                      Gap(normalPadding),
                      Divider(),
                      if (pageType == PageType.hotel) ...[
                        Gap(normalPadding),
                        HotelBestOffer(bestOffer: hotel.bestOffer),
                      ],
                    ],
                  ),
                ),
                Gap(normalPadding),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: normalPadding),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(pageType.getButtonText(context)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
