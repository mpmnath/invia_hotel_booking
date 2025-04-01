import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_card_widget.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/cubits/hotels_cubit.dart';

@RoutePage()
class HotelsPage extends StatelessWidget {
  const HotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        switch (state) {
          case HotelsInitial():
            return const Center(child: Text('Initial State'));

          case HotelsLoading():
            return const Center(child: CircularProgressIndicator());

          case HotelsLoaded():
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: mediumPadding,
                horizontal: smallPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mediumPadding,
                      vertical: smallPadding,
                    ),
                    child: Text(
                      context.l10n.hotelsCountTitle(
                        state.hotels.length,
                        "Mallorca", // Hardcoded as the destination is null
                      ),
                      style: context.textTheme.titleMedium!.copyWith(
                        color: context.primaryTextColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: smallPadding),
                      itemCount: state.hotels.length,
                      itemBuilder: (context, index) {
                        final hotel = state.hotels[index];

                        return BlocSelector<FavoritesCubit, List<Hotel>, bool>(
                          selector:
                              (favorites) =>
                                  favorites.any((h) => h.id == hotel.id),
                          builder: (context, isFavorite) {
                            return HotelCard(
                              hotel: hotel,
                              isFavorite: isFavorite,
                              onFavoriteToggle: () {
                                context.read<FavoritesCubit>().toggleFavorite(
                                  hotel,
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );

          case HotelsError error:
            return Center(child: Text(error.message));

          default:
            return Center(
              child: TextButton(
                onPressed: () => context.read<HotelsCubit>().getHotels(),
                child: Text(context.l10n.tryAgain),
              ),
            );
        }
      },
    );
  }
}
