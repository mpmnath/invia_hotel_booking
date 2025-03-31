// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomsModelAdapter extends TypeAdapter<RoomsModel> {
  @override
  final int typeId = 5;

  @override
  RoomsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoomsModel(
      overall: fields[0] as OverallModel,
      pricesAndOccupancy: (fields[1] as List).cast<PricesAndOccupancyModel>(),
      roomGroups: (fields[2] as List).cast<RoomGroupsModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, RoomsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.overall)
      ..writeByte(1)
      ..write(obj.pricesAndOccupancy)
      ..writeByte(2)
      ..write(obj.roomGroups);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomsModel _$RoomsModelFromJson(Map<String, dynamic> json) => RoomsModel(
      overall: OverallModel.fromJson(json['overall'] as Map<String, dynamic>),
      pricesAndOccupancy: (json['prices-and-occupancy'] as List<dynamic>)
          .map((e) =>
              PricesAndOccupancyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      roomGroups: (json['room-groups'] as List<dynamic>)
          .map((e) => RoomGroupsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomsModelToJson(RoomsModel instance) =>
    <String, dynamic>{
      'overall': instance.overall,
      'prices-and-occupancy': instance.pricesAndOccupancy,
      'room-groups': instance.roomGroups,
    };
