import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invia_hotel_booking/core/extensions/context_ext.dart';
import 'package:invia_hotel_booking/core/locale/locale_cubit.dart';
import 'package:invia_hotel_booking/core/theme/cubit/theme_cubit.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final locale = context.watch<LocaleCubit>().state;

    return ListView(
      children: [
        ListTile(
          title: Text(context.l10n.theme, style: context.textTheme.titleSmall),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<ThemeMode>(
              value: themeMode,
              style: context.textTheme.bodyMedium,
              dropdownColor: context.colorScheme.primaryContainer,

              items: [
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text(context.l10n.lightTheme),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text(context.l10n.darkTheme),
                ),
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text(context.l10n.systemTheme),
                ),
              ],
              onChanged: (mode) {
                if (mode != null) {
                  context.read<ThemeCubit>().toggleTheme(mode);
                }
              },
            ),
          ),
        ),
        ListTile(
          title: Text(
            context.l10n.language,
            style: context.textTheme.titleSmall,
          ),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<Locale>(
              value: locale,
              style: context.textTheme.bodyMedium,
              dropdownColor: context.colorScheme.primaryContainer,
              items: [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('de'), child: Text('Deutsch')),
                DropdownMenuItem(value: Locale('fr'), child: Text('Français')),
                DropdownMenuItem(value: Locale('es'), child: Text('Español')),
                DropdownMenuItem(value: Locale('it'), child: Text('Italiano')),
              ],
              onChanged: (locale) {
                if (locale != null) {
                  context.read<LocaleCubit>().changeLocale(locale);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
