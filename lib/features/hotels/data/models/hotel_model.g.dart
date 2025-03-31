// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) => HotelModel(
  hotelId: json['hotel-id'] as String,
  name: json['name'] as String,
  destination: json['destination'] as String,
  category: (json['category'] as num).toInt(),
  categoryType: json['category-type'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  images:
      (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  rating: RatingModel.fromJson(json['rating-info'] as Map<String, dynamic>),
  bestOffer: BestOfferModel.fromJson(
    json['best-offer'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$HotelModelToJson(HotelModel instance) =>
    <String, dynamic>{
      'hotel-id': instance.hotelId,
      'name': instance.name,
      'destination': instance.destination,
      'category': instance.category,
      'category-type': instance.categoryType,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'images': instance.images.map((e) => e.toJson()).toList(),
      'rating-info': instance.rating.toJson(),
      'best-offer': instance.bestOffer.toJson(),
    };
