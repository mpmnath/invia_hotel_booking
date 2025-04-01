import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/image_carousel_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('ImageCarouselWidget', () {
    final testUrls = [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
      'https://example.com/image3.jpg',
    ];

    testWidgets('displays all images in PageView', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: ImageCarouselWidget(imageUrls: testUrls)),
          ),
        );

        expect(find.byType(PageView), findsOneWidget);
        expect(find.byType(Image), findsWidgets); // Checks if images exist
      });
    });

    testWidgets('allows swiping between images', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: ImageCarouselWidget(imageUrls: testUrls)),
          ),
        );

        final pageViewFinder = find.byType(PageView);
        expect(pageViewFinder, findsOneWidget);

        await tester.drag(pageViewFinder, const Offset(-300, 0));
        await tester.pump(const Duration(milliseconds: 500));

        expect(find.byType(Image), findsWidgets);
      });
    });
  });
}
