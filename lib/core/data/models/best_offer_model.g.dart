// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_offer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BestOfferModelAdapter extends TypeAdapter<BestOfferModel> {
  @override
  final int typeId = 3;

  @override
  BestOfferModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BestOfferModel(
      travelDate: fields[0] as TravelDateModel,
      rooms: fields[1] as RoomsModel,
      flightIncluded: fields[2] as bool,
      availableSpecialGroups: (fields[3] as List).cast<String>(),
      travelPrice: fields[4] as double,
      total: fields[5] as double,
      simplePricePerPerson: fields[6] as double,
      originalTravelPrice: fields[7] as double,
      includedTravelDiscount: fields[8] as double,
      detailedPricePerPerson: (fields[9] as List).cast<double>(),
      appliedTravelDiscount: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BestOfferModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.travelDate)
      ..writeByte(1)
      ..write(obj.rooms)
      ..writeByte(2)
      ..write(obj.flightIncluded)
      ..writeByte(3)
      ..write(obj.availableSpecialGroups)
      ..writeByte(4)
      ..write(obj.travelPrice)
      ..writeByte(5)
      ..write(obj.total)
      ..writeByte(6)
      ..write(obj.simplePricePerPerson)
      ..writeByte(7)
      ..write(obj.originalTravelPrice)
      ..writeByte(8)
      ..write(obj.includedTravelDiscount)
      ..writeByte(9)
      ..write(obj.detailedPricePerPerson)
      ..writeByte(10)
      ..write(obj.appliedTravelDiscount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BestOfferModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestOfferModel _$BestOfferModelFromJson(Map<String, dynamic> json) =>
    BestOfferModel(
      travelDate:
          TravelDateModel.fromJson(json['travel-date'] as Map<String, dynamic>),
      rooms: RoomsModel.fromJson(json['rooms'] as Map<String, dynamic>),
      flightIncluded: json['flight-included'] as bool,
      availableSpecialGroups:
          (json['available-special-groups'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      travelPrice: (json['travel-price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      simplePricePerPerson: (json['simple-price-per-person'] as num).toDouble(),
      originalTravelPrice: (json['original-travel-price'] as num).toDouble(),
      includedTravelDiscount:
          (json['included-travel-discount'] as num).toDouble(),
      detailedPricePerPerson:
          (json['detailed-price-per-person'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
      appliedTravelDiscount: json['applied-travel-discount'] as String?,
    );

Map<String, dynamic> _$BestOfferModelToJson(BestOfferModel instance) =>
    <String, dynamic>{
      'travel-date': instance.travelDate,
      'rooms': instance.rooms,
      'flight-included': instance.flightIncluded,
      'available-special-groups': instance.availableSpecialGroups,
      'travel-price': instance.travelPrice,
      'total': instance.total,
      'simple-price-per-person': instance.simplePricePerPerson,
      'original-travel-price': instance.originalTravelPrice,
      'included-travel-discount': instance.includedTravelDiscount,
      'detailed-price-per-person': instance.detailedPricePerPerson,
      'applied-travel-discount': instance.appliedTravelDiscount,
    };
