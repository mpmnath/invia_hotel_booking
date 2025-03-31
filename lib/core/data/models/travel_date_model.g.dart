// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_date_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TravelDateModelAdapter extends TypeAdapter<TravelDateModel> {
  @override
  final int typeId = 4;

  @override
  TravelDateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TravelDateModel(
      days: fields[0] as int,
      departureDate: fields[1] as String,
      nights: fields[2] as int,
      returnDate: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TravelDateModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.days)
      ..writeByte(1)
      ..write(obj.departureDate)
      ..writeByte(2)
      ..write(obj.nights)
      ..writeByte(3)
      ..write(obj.returnDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TravelDateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelDateModel _$TravelDateModelFromJson(Map<String, dynamic> json) =>
    TravelDateModel(
      days: (json['days'] as num).toInt(),
      departureDate: json['departure-date'] as String,
      nights: (json['nights'] as num).toInt(),
      returnDate: json['return-date'] as String,
    );

Map<String, dynamic> _$TravelDateModelToJson(TravelDateModel instance) =>
    <String, dynamic>{
      'days': instance.days,
      'departure-date': instance.departureDate,
      'nights': instance.nights,
      'return-date': instance.returnDate,
    };
