// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_groups_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomGroupsModelAdapter extends TypeAdapter<RoomGroupsModel> {
  @override
  final int typeId = 8;

  @override
  RoomGroupsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoomGroupsModel(
      attributes: (fields[0] as List).cast<dynamic>(),
      boarding: fields[1] as String,
      name: fields[2] as String,
      detailedDescription: fields[3] as String?,
      groupIdentifier: fields[4] as String,
      quantity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RoomGroupsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.attributes)
      ..writeByte(1)
      ..write(obj.boarding)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.detailedDescription)
      ..writeByte(4)
      ..write(obj.groupIdentifier)
      ..writeByte(5)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomGroupsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
