import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/image_widget.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  const testImageUrl = 'https://example.com/image.jpg';

  group('ImageWidget', () {
    testWidgets('shows shimmer placeholder', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ImageWidget(
            imageUrl: testImageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      );

      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
    });
  });
}
