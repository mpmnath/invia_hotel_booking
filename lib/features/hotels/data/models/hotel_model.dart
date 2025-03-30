import 'package:invia_hotel_booking/features/hotels/data/models/best_offer_model.dart';
import 'package:invia_hotel_booking/features/hotels/data/models/image_model.dart';
import 'package:invia_hotel_booking/features/hotels/data/models/rating_model.dart';
import 'package:invia_hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
class HotelModel {
  @JsonKey(name: 'hotel-id')
  final String hotelId;
  final String name;
  final String destination;
  final double category;
  @JsonKey(name: 'category-type')
  final String categoryType;
  final double latitude;
  final double longitude;
  final List<ImageModel> images;
  @JsonKey(name: 'rating-info')
  final RatingModel rating;
  @JsonKey(name: 'best-offer')
  final BestOfferModel bestOffer;

  HotelModel({
    required this.hotelId,
    required this.name,
    required this.destination,
    required this.category,
    required this.categoryType,
    required this.latitude,
    required this.longitude,
    required this.images,
    required this.rating,
    required this.bestOffer,
  });

  Map<String, dynamic> toJson() => _$HotelModelToJson(this);

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);

  // Convert to domain entity
  Hotel toEntity() {
    return Hotel(
      id: hotelId,
      name: name,
      destination: destination,
      category: category,
      categoryType: categoryType,
      latitude: latitude,
      longitude: longitude,
      images: images.map((image) => image.toEntity()).toList(),
      rating: rating.toEntity(),
      bestOffer: bestOffer.toEntity(),
    );
  }

  // Create from domain entity
  factory HotelModel.fromEntity(Hotel hotel) {
    return HotelModel(
      hotelId: hotel.id,
      name: hotel.name,
      destination: hotel.destination,
      category: hotel.category,
      categoryType: hotel.categoryType,
      latitude: hotel.latitude,
      longitude: hotel.longitude,
      images:
          hotel.images.map((image) => ImageModel.fromEntity(image)).toList(),
      rating: RatingModel.fromEntity(hotel.rating),
      bestOffer: BestOfferModel.fromEntity(hotel.bestOffer),
    );
  }
}
