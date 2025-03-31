import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price_and_occupancy_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
@HiveType(typeId: 7)
class PricesAndOccupancyModel {
  @JsonKey(name: 'adult-count')
  @HiveField(0)
  final int adultCount;
  @JsonKey(name: 'children-ages')
  @HiveField(1)
  final List<int> childrenAges;
  @JsonKey(name: 'children-count')
  @HiveField(2)
  final int childrenCount;
  @JsonKey(name: 'detailed-price-per-person')
  @HiveField(3)
  final List<double> detailedPricePerPerson;
  @JsonKey(name: 'group-identifier')
  @HiveField(4)
  final String groupIdentifier;
  @JsonKey(name: 'simple-price-per-person')
  @HiveField(5)
  final double simplePricePerPerson;
  @HiveField(6)
  final double total;

  PricesAndOccupancyModel({
    required this.adultCount,
    required this.childrenAges,
    required this.childrenCount,
    required this.detailedPricePerPerson,
    required this.groupIdentifier,
    required this.simplePricePerPerson,
    required this.total,
  });

  Map<String, dynamic> toJson() => _$PricesAndOccupancyModelToJson(this);

  factory PricesAndOccupancyModel.fromJson(Map<String, dynamic> json) =>
      _$PricesAndOccupancyModelFromJson(json);

  PricesAndOccupancy toEntity() {
    return PricesAndOccupancy(
      adultCount: adultCount,
      childrenAges: childrenAges,
      childrenCount: childrenCount,
      detailedPricePerPerson: detailedPricePerPerson,
      groupIdentifier: groupIdentifier,
      simplePricePerPerson: simplePricePerPerson,
      total: total,
    );
  }

  factory PricesAndOccupancyModel.fromEntity(
    PricesAndOccupancy pricesAndOccupancy,
  ) {
    return PricesAndOccupancyModel(
      adultCount: pricesAndOccupancy.adultCount,
      childrenAges: pricesAndOccupancy.childrenAges,
      childrenCount: pricesAndOccupancy.childrenCount,
      detailedPricePerPerson: pricesAndOccupancy.detailedPricePerPerson,
      groupIdentifier: pricesAndOccupancy.groupIdentifier,
      simplePricePerPerson: pricesAndOccupancy.simplePricePerPerson,
      total: pricesAndOccupancy.total,
    );
  }
}
