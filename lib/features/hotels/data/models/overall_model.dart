import 'package:invia_hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'overall_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class OverallModel {
  final List<dynamic> attributes;
  final String boarding;
  final String name;
  @JsonKey(name: 'adult-count')
  final int adultCount;
  @JsonKey(name: 'children-count')
  final int childrenCount;
  @JsonKey(name: 'children-ages')
  final List<int> childrenAges;
  final int quantity;
  @JsonKey(name: 'same-boarding')
  final bool sameBoarding;
  @JsonKey(name: 'same-room-groups')
  final bool sameRoomGroups;

  OverallModel({
    required this.attributes,
    required this.boarding,
    required this.name,
    required this.adultCount,
    required this.childrenCount,
    required this.childrenAges,
    required this.quantity,
    required this.sameBoarding,
    required this.sameRoomGroups,
  });

  Map<String, dynamic> toJson() => _$OverallModelToJson(this);

  factory OverallModel.fromJson(Map<String, dynamic> json) =>
      _$OverallModelFromJson(json);

  Overall toEntity() {
    return Overall(
      attributes: attributes,
      name: name,
      boarding: boarding,
      adultCount: adultCount,
      childrenCount: childrenCount,
      childrenAges: childrenAges,
      quantity: quantity,
      sameBoarding: sameBoarding,
      sameRoomGroups: sameRoomGroups,
    );
  }

  factory OverallModel.fromEntity(Overall roomOverall) {
    return OverallModel(
      attributes: [],
      boarding: roomOverall.boarding,
      name: roomOverall.name,
      adultCount: roomOverall.adultCount,
      childrenCount: roomOverall.childrenCount,
      childrenAges: [],
      quantity: roomOverall.quantity,
      sameBoarding: roomOverall.sameBoarding,
      sameRoomGroups: roomOverall.sameRoomGroups,
    );
  }
}
