import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:invia_hotel_booking/core/constants/values.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/hotel_card_widget.dart';
import 'package:invia_hotel_booking/features/favorites/presentation/cubits/favorites_cubit.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/cubits/hotels_cubit.dart';
import 'package:invia_hotel_booking/features/hotels/presentation/view/widgets/retry_widget.dart';

@RoutePage()
class HotelsPage extends StatefulWidget {
  const HotelsPage({super.key});

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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

                        return HotelCard(
                          key: ValueKey(hotel.id),
                          hotel: hotel,
                          onFavoriteToggle: () {
                            context.read<FavoritesCubit>().toggleFavorite(
                              hotel,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );

          case HotelsError():
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.l10n.errorLoadingHotels),
                  Gap(smallPadding),
                  RetryWidget(),
                ],
              ),
            );

          default:
            return Center(child: RetryWidget());
        }
      },
    );
  }
}
