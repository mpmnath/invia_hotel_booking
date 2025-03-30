import 'package:invia_hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'travel_date_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class TravelDateModel {
  final int days;
  @JsonKey(name: 'departure-date')
  final String departureDate;
  final int nights;
  @JsonKey(name: 'return-date')
  final String returnDate;

  TravelDateModel({
    required this.days,
    required this.departureDate,
    required this.nights,
    required this.returnDate,
  });

  Map<String, dynamic> toJson() => _$TravelDateModelToJson(this);

  factory TravelDateModel.fromJson(Map<String, dynamic> json) =>
      _$TravelDateModelFromJson(json);

  TravelDate toEntity() {
    return TravelDate(
      days: days,
      departureDate: departureDate,
      nights: nights,
      returnDate: returnDate,
    );
  }

  factory TravelDateModel.fromEntity(TravelDate travelDate) {
    return TravelDateModel(
      days: travelDate.days,
      departureDate: travelDate.departureDate,
      nights: travelDate.nights,
      returnDate: travelDate.returnDate,
    );
  }
}
