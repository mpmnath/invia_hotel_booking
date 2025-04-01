import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/favorite_widget.dart';

void main() {
  testWidgets('displays red heart when favorite is true', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: FavoriteWidget(isFavorite: true, onTap: () {})),
    );

    final icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.color, Colors.red);
  });

  testWidgets('displays white heart when favorite is false', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: FavoriteWidget(isFavorite: false, onTap: () {})),
    );

    final icon = tester.widget<Icon>(find.byType(Icon));
    expect(icon.color, Colors.white);
  });

  testWidgets('calls onTap when tapped', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: FavoriteWidget(
          isFavorite: false,
          onTap: () {
            tapped = true;
          },
        ),
      ),
    );

    await tester.tap(find.byType(IconButton));
    expect(tapped, isTrue);
  });
}
