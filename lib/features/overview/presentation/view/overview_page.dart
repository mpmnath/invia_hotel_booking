import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';

@RoutePage()
class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.l10n.overview));
  }
}
