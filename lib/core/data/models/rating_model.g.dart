// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RatingModelAdapter extends TypeAdapter<RatingModel> {
  @override
  final int typeId = 2;

  @override
  RatingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatingModel(
      score: fields[0] as double,
      scoreDescription: fields[1] as String,
      reviewsCount: fields[2] as int,
      recommendationRate: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, RatingModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.score)
      ..writeByte(1)
      ..write(obj.scoreDescription)
      ..writeByte(2)
      ..write(obj.reviewsCount)
      ..writeByte(3)
      ..write(obj.recommendationRate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => RatingModel(
      score: (json['score'] as num).toDouble(),
      scoreDescription: json['score-description'] as String,
      reviewsCount: (json['reviews-count'] as num).toInt(),
      recommendationRate: (json['recommendation-rate'] as num).toDouble(),
    );

Map<String, dynamic> _$RatingModelToJson(RatingModel instance) =>
    <String, dynamic>{
      'score': instance.score,
      'score-description': instance.scoreDescription,
      'reviews-count': instance.reviewsCount,
      'recommendation-rate': instance.recommendationRate,
    };
