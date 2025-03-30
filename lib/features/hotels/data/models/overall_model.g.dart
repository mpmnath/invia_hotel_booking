// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverallModel _$OverallModelFromJson(Map<String, dynamic> json) => OverallModel(
  attributes:
      (json['attributes'] as List<dynamic>).map((e) => e as String).toList(),
  boarding: json['boarding'] as String,
  name: json['name'] as String,
  adultCount: (json['adult-count'] as num).toInt(),
  childrenCount: (json['children-count'] as num).toInt(),
  childrenAges:
      (json['children-ages'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  quantity: (json['quantity'] as num).toInt(),
  sameBoarding: json['same-boarding'] as bool,
  sameRoomGroups: json['same-room-groups'] as bool,
);

Map<String, dynamic> _$OverallModelToJson(OverallModel instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'boarding': instance.boarding,
      'name': instance.name,
      'adult-count': instance.adultCount,
      'children-count': instance.childrenCount,
      'children-ages': instance.childrenAges,
      'quantity': instance.quantity,
      'same-boarding': instance.sameBoarding,
      'same-room-groups': instance.sameRoomGroups,
    };
