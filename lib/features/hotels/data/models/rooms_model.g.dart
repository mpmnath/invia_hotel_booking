// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomsModel _$RoomsModelFromJson(Map<String, dynamic> json) => RoomsModel(
  overall: OverallModel.fromJson(json['overall'] as Map<String, dynamic>),
  pricesAndOccupancy:
      (json['prices-and-occupancy'] as List<dynamic>)
          .map(
            (e) => PricesAndOccupancyModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  roomGroups:
      (json['room-groups'] as List<dynamic>)
          .map((e) => RoomGroupsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$RoomsModelToJson(RoomsModel instance) =>
    <String, dynamic>{
      'overall': instance.overall,
      'prices-and-occupancy': instance.pricesAndOccupancy,
      'room-groups': instance.roomGroups,
    };
