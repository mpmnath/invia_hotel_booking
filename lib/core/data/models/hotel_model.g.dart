// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HotelModelAdapter extends TypeAdapter<HotelModel> {
  @override
  final int typeId = 0;

  @override
  HotelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HotelModel(
      hotelId: fields[0] as String,
      name: fields[1] as String,
      destination: fields[2] as String,
      category: fields[3] as int,
      categoryType: fields[4] as String,
      latitude: fields[5] as double,
      longitude: fields[6] as double,
      images: (fields[7] as List).cast<ImageModel>(),
      rating: fields[8] as RatingModel,
      bestOffer: fields[9] as BestOfferModel,
    );
  }

  @override
  void write(BinaryWriter writer, HotelModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.hotelId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.destination)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.categoryType)
      ..writeByte(5)
      ..write(obj.latitude)
      ..writeByte(6)
      ..write(obj.longitude)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.bestOffer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: RatingModel.fromJson(json['rating-info'] as Map<String, dynamic>),
      bestOffer:
          BestOfferModel.fromJson(json['best-offer'] as Map<String, dynamic>),
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
