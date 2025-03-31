import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
@HiveType(typeId: 2)
class RatingModel {
  @HiveField(0)
  final double score;
  @JsonKey(name: 'score-description')
  @HiveField(1)
  final String scoreDescription;
  @JsonKey(name: 'reviews-count')
  @HiveField(2)
  final int reviewsCount;
  @JsonKey(name: 'recommendation-rate')
  @HiveField(3)
  final double recommendationRate;

  RatingModel({
    required this.score,
    required this.scoreDescription,
    required this.reviewsCount,
    required this.recommendationRate,
  });

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Rating toEntity() {
    return Rating(
      score: score,
      scoreDescription: scoreDescription,
      reviewsCount: reviewsCount,
      recommendationRate: recommendationRate,
    );
  }

  factory RatingModel.fromEntity(Rating? rating) {
    if (rating == null) {
      return RatingModel(
        score: 0.0,
        scoreDescription: '',
        reviewsCount: 0,
        recommendationRate: 0.0,
      );
    }
    return RatingModel(
      score: rating.score,
      scoreDescription: rating.scoreDescription,
      reviewsCount: rating.reviewsCount,
      recommendationRate: rating.recommendationRate,
    );
  }
}
