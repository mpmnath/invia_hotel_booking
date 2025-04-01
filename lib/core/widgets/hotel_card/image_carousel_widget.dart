import 'package:flutter/material.dart';
import 'package:invia_hotel_booking/core/widgets/hotel_card/image_widget.dart';

class ImageCarouselWidget extends StatelessWidget {
  final List<String> imageUrls;
  const ImageCarouselWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 186,
      child: PageView.builder(
        controller: PageController(viewportFraction: 1),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return ImageWidget(
            imageUrl: imageUrls[index],
            width: double.infinity,
            height: 186,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
