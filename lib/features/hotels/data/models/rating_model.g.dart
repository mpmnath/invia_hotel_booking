// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

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
