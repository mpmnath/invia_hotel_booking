import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';
import 'package:invia_hotel_booking/core/types/page_type.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_card_widget.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';

@RoutePage()
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavoritesCubit, List<Hotel>, List<Hotel>>(
      selector: (favorites) => favorites,
      builder: (context, favorites) {
        if (favorites.isEmpty) {
          return Center(child: Text(context.l10n.noFavorites));
        }
        return ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: smallPadding,
            vertical: veryBigPadding,
          ),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final hotel = favorites[index];
            return HotelCard(
              key: ValueKey(hotel.id),
              hotel: hotel,
              pageType: PageType.favorites,
              onFavoriteToggle: () {
                context.read<FavoritesCubit>().toggleFavorite(hotel);
              },
            );
          },
        );
      },
    );
  }
}
