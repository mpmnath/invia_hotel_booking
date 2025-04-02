import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:invia_hotel_booking/core/router/app_router.dart';

@singleton
class DeepLinkService {
  final AppRouter _router;
  late final AppLinks _appLinks;
  late final StreamSubscription<Uri> _linkSubscription;

  DeepLinkService(this._router) {
    _init();
  }

  Future<void> _init() async {
    _appLinks = AppLinks();

    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _handleDeepLink(initialUri);
      }
    } catch (e) {
      debugPrint('Error handling initial URI: $e');
    }

    _linkSubscription = _appLinks.uriLinkStream.listen(_handleDeepLink);
  }

  void _handleDeepLink(Uri uri) {
    debugPrint('Received deep link: $uri');

    // Check if we have the expected host
    if (uri.host != 'hotelbooking') {
      debugPrint('Unexpected host: ${uri.host}');
      _router.navigate(OverviewRoute());
      return;
    }

    // Get the path without the leading slash
    final pathSegments = uri.pathSegments;

    if (pathSegments.isEmpty) {
      _router.navigate(OverviewRoute());
      return;
    }

    // First segment after the host
    final path = pathSegments.first;

    switch (path) {
      case 'hotels':
        _router.navigate(HotelsRoute());
        break;
      case 'favorites':
        _router.navigate(FavoritesRoute());
        break;
      case 'account':
        _router.navigate(AccountRoute());
        break;
      default:
        _router.navigate(OverviewRoute());
    }
  }

  @disposeMethod
  void dispose() {
    _linkSubscription.cancel();
  }
}
