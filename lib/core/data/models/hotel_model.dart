import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/data/models/best_offer_model.dart';
import 'package:invia_hotel_booking/core/data/models/image_model.dart';
import 'package:invia_hotel_booking/core/data/models/rating_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.kebab)
@HiveType(typeId: 0)
class HotelModel {
  @JsonKey(name: 'hotel-id')
  @HiveField(0)
  final String hotelId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String destination;
  @HiveField(3)
  final int category;
  @JsonKey(name: 'category-type')
  @HiveField(4)
  final String categoryType;
  @HiveField(5)
  final double latitude;
  @HiveField(6)
  final double longitude;
  @HiveField(7)
  final List<ImageModel> images;
  @JsonKey(name: 'rating-info')
  @HiveField(8)
  final RatingModel rating;
  @JsonKey(name: 'best-offer')
  @HiveField(9)
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
