import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'travel_date_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
@HiveType(typeId: 4)
class TravelDateModel {
  @HiveField(0)
  final int days;
  @JsonKey(name: 'departure-date')
  @HiveField(1)
  final String departureDate;
  @HiveField(2)
  final int nights;
  @JsonKey(name: 'return-date')
  @HiveField(3)
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
