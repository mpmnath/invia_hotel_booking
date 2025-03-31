import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/data/models/overall_model.dart';
import 'package:invia_hotel_booking/core/data/models/price_and_occupancy_model.dart';
import 'package:invia_hotel_booking/core/data/models/room_groups_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rooms_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
@HiveType(typeId: 5)
class RoomsModel {
  @HiveField(0)
  final OverallModel overall;
  @JsonKey(name: 'prices-and-occupancy')
  @HiveField(1)
  final List<PricesAndOccupancyModel> pricesAndOccupancy;
  @JsonKey(name: 'room-groups')
  @HiveField(2)
  final List<RoomGroupsModel> roomGroups;

  RoomsModel({
    required this.overall,
    required this.pricesAndOccupancy,
    required this.roomGroups,
  });

  Map<String, dynamic> toJson() => _$RoomsModelToJson(this);

  factory RoomsModel.fromJson(Map<String, dynamic> json) =>
      _$RoomsModelFromJson(json);

  Rooms toEntity() {
    return Rooms(
      overall: overall.toEntity(),
      pricesAndOccupancy: pricesAndOccupancy.map((e) => e.toEntity()).toList(),
      roomGroups: roomGroups.map((e) => e.toEntity()).toList(),
    );
  }

  factory RoomsModel.fromEntity(Rooms rooms) {
    return RoomsModel(
      overall: OverallModel.fromEntity(rooms.overall),
      pricesAndOccupancy:
          rooms.pricesAndOccupancy
              .map((e) => PricesAndOccupancyModel.fromEntity(e))
              .toList(),
      roomGroups:
          rooms.roomGroups.map((e) => RoomGroupsModel.fromEntity(e)).toList(),
    );
  }
}
