import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_groups_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
@HiveType(typeId: 8)
class RoomGroupsModel {
  @HiveField(0)
  final List<dynamic> attributes;
  @HiveField(1)
  final String boarding;
  @HiveField(2)
  final String name;
  @JsonKey(name: 'detailed-description')
  @HiveField(3)
  final String? detailedDescription;
  @JsonKey(name: 'group-identifier')
  @HiveField(4)
  final String groupIdentifier;
  @HiveField(5)
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
