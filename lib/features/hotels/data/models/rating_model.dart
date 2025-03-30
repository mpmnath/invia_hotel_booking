import 'package:invia_hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class RatingModel {
  final double score;
  @JsonKey(name: 'score-description')
  final String scoreDescription;
  @JsonKey(name: 'reviews-count')
  final int reviewsCount;
  @JsonKey(name: 'recommendation-rate')
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
