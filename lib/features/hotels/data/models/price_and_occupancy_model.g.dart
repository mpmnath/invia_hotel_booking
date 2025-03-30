// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_and_occupancy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricesAndOccupancyModel _$PricesAndOccupancyModelFromJson(
  Map<String, dynamic> json,
) => PricesAndOccupancyModel(
  adultCount: (json['adult-count'] as num).toInt(),
  childrenAges:
      (json['children-ages'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  childrenCount: (json['children-count'] as num).toInt(),
  detailedPricePerPerson:
      (json['detailed-price-per-person'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  groupIdentifier: json['group-identifier'] as String,
  simplePricePerPerson: (json['simple-price-per-person'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
);

Map<String, dynamic> _$PricesAndOccupancyModelToJson(
  PricesAndOccupancyModel instance,
) => <String, dynamic>{
  'adult-count': instance.adultCount,
  'children-ages': instance.childrenAges,
  'children-count': instance.childrenCount,
  'detailed-price-per-person': instance.detailedPricePerPerson,
  'group-identifier': instance.groupIdentifier,
  'simple-price-per-person': instance.simplePricePerPerson,
  'total': instance.total,
};
