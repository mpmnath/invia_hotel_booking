import 'package:flutter/material.dart';

class FavoriteWidget extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;
  const FavoriteWidget({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.favorite,
        color: isFavorite ? Colors.red : Colors.white,
        weight: 2,
        size: 24,
      ),
    );
  }
}
