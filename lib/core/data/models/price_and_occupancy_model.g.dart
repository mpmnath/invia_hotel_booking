// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_and_occupancy_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PricesAndOccupancyModelAdapter
    extends TypeAdapter<PricesAndOccupancyModel> {
  @override
  final int typeId = 7;

  @override
  PricesAndOccupancyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PricesAndOccupancyModel(
      adultCount: fields[0] as int,
      childrenAges: (fields[1] as List).cast<int>(),
      childrenCount: fields[2] as int,
      detailedPricePerPerson: (fields[3] as List).cast<double>(),
      groupIdentifier: fields[4] as String,
      simplePricePerPerson: fields[5] as double,
      total: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PricesAndOccupancyModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.adultCount)
      ..writeByte(1)
      ..write(obj.childrenAges)
      ..writeByte(2)
      ..write(obj.childrenCount)
      ..writeByte(3)
      ..write(obj.detailedPricePerPerson)
      ..writeByte(4)
      ..write(obj.groupIdentifier)
      ..writeByte(5)
      ..write(obj.simplePricePerPerson)
      ..writeByte(6)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PricesAndOccupancyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricesAndOccupancyModel _$PricesAndOccupancyModelFromJson(
        Map<String, dynamic> json) =>
    PricesAndOccupancyModel(
      adultCount: (json['adult-count'] as num).toInt(),
      childrenAges: (json['children-ages'] as List<dynamic>)
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
        PricesAndOccupancyModel instance) =>
    <String, dynamic>{
      'adult-count': instance.adultCount,
      'children-ages': instance.childrenAges,
      'children-count': instance.childrenCount,
      'detailed-price-per-person': instance.detailedPricePerPerson,
      'group-identifier': instance.groupIdentifier,
      'simple-price-per-person': instance.simplePricePerPerson,
      'total': instance.total,
    };
