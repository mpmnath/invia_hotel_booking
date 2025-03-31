// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OverallModelAdapter extends TypeAdapter<OverallModel> {
  @override
  final int typeId = 6;

  @override
  OverallModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OverallModel(
      attributes: (fields[0] as List).cast<dynamic>(),
      boarding: fields[1] as String,
      name: fields[2] as String,
      adultCount: fields[3] as int,
      childrenCount: fields[4] as int,
      childrenAges: (fields[5] as List).cast<int>(),
      quantity: fields[6] as int,
      sameBoarding: fields[7] as bool,
      sameRoomGroups: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OverallModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.attributes)
      ..writeByte(1)
      ..write(obj.boarding)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.adultCount)
      ..writeByte(4)
      ..write(obj.childrenCount)
      ..writeByte(5)
      ..write(obj.childrenAges)
      ..writeByte(6)
      ..write(obj.quantity)
      ..writeByte(7)
      ..write(obj.sameBoarding)
      ..writeByte(8)
      ..write(obj.sameRoomGroups);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OverallModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverallModel _$OverallModelFromJson(Map<String, dynamic> json) => OverallModel(
      attributes: json['attributes'] as List<dynamic>,
      boarding: json['boarding'] as String,
      name: json['name'] as String,
      adultCount: (json['adult-count'] as num).toInt(),
      childrenCount: (json['children-count'] as num).toInt(),
      childrenAges: (json['children-ages'] as List<dynamic>)
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
