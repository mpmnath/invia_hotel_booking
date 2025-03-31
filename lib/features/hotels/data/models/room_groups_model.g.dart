// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_groups_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomGroupsModel _$RoomGroupsModelFromJson(Map<String, dynamic> json) =>
    RoomGroupsModel(
      attributes: json['attributes'] as List<dynamic>,
      boarding: json['boarding'] as String,
      name: json['name'] as String,
      detailedDescription: json['detailed-description'] as String?,
      groupIdentifier: json['group-identifier'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$RoomGroupsModelToJson(RoomGroupsModel instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'boarding': instance.boarding,
      'name': instance.name,
      'detailed-description': instance.detailedDescription,
      'group-identifier': instance.groupIdentifier,
      'quantity': instance.quantity,
    };
