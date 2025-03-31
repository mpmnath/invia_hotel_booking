import 'package:invia_hotel_booking/features/hotels/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_groups_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class RoomGroupsModel {
  final List<dynamic> attributes;
  final String boarding;
  final String name;
  @JsonKey(name: 'detailed-description')
  final String? detailedDescription;
  @JsonKey(name: 'group-identifier')
  final String groupIdentifier;
  final int quantity;

  RoomGroupsModel({
    required this.attributes,
    required this.boarding,
    required this.name,
    this.detailedDescription,
    required this.groupIdentifier,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => _$RoomGroupsModelToJson(this);

  factory RoomGroupsModel.fromJson(Map<String, dynamic> json) =>
      _$RoomGroupsModelFromJson(json);

  RoomGroups toEntity() {
    return RoomGroups(
      attributes: attributes,
      boarding: boarding,
      name: name,
      detailedDescription: detailedDescription ?? '',
      groupIdentifier: groupIdentifier,
      quantity: quantity,
    );
  }

  factory RoomGroupsModel.fromEntity(RoomGroups roomGroups) {
    return RoomGroupsModel(
      attributes: roomGroups.attributes,
      boarding: roomGroups.boarding,
      name: roomGroups.name,
      detailedDescription: roomGroups.detailedDescription,
      groupIdentifier: roomGroups.groupIdentifier,
      quantity: roomGroups.quantity,
    );
  }
}
