import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/data/models/overall_model.dart';
import 'package:invia_hotel_booking/core/data/models/rooms_model.dart';
import 'package:invia_hotel_booking/core/data/models/travel_date_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_offer_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
@HiveType(typeId: 3)
class BestOfferModel {
  @JsonKey(name: 'travel-date')
  @HiveField(0)
  final TravelDateModel travelDate;
  @HiveField(1)
  final RoomsModel rooms;
  @JsonKey(name: 'flight-included')
  @HiveField(2)
  final bool flightIncluded;
  @JsonKey(name: 'available-special-groups')
  @HiveField(3)
  final List<String> availableSpecialGroups;
  @JsonKey(name: 'travel-price')
  @HiveField(4)
  final double travelPrice;
  @HiveField(5)
  final double total;
  @JsonKey(name: 'simple-price-per-person')
  @HiveField(6)
  final double simplePricePerPerson;
  @JsonKey(name: 'original-travel-price')
  @HiveField(7)
  final double originalTravelPrice;
  @JsonKey(name: 'included-travel-discount')
  @HiveField(8)
  final double includedTravelDiscount;
  @JsonKey(name: 'detailed-price-per-person')
  @HiveField(9)
  final List<double> detailedPricePerPerson;
  @JsonKey(name: 'applied-travel-discount')
  @HiveField(10)
  final String? appliedTravelDiscount;

  BestOfferModel({
    required this.travelDate,
    required this.rooms,
    required this.flightIncluded,
    required this.availableSpecialGroups,
    required this.travelPrice,
    required this.total,
    required this.simplePricePerPerson,
    required this.originalTravelPrice,
    required this.includedTravelDiscount,
    required this.detailedPricePerPerson,
    this.appliedTravelDiscount,
  });

  Map<String, dynamic> toJson() => _$BestOfferModelToJson(this);

  factory BestOfferModel.fromJson(Map<String, dynamic> json) =>
      _$BestOfferModelFromJson(json);

  BestOffer toEntity() {
    return BestOffer(
      travelDate: travelDate.toEntity(),
      rooms: rooms.toEntity(),
      flightIncluded: flightIncluded,
      availableSpecialGroups: availableSpecialGroups,
      travelPrice: travelPrice,
      total: total,
      simplePricePerPerson: simplePricePerPerson,
      originalTravelPrice: originalTravelPrice,
      includedTravelDiscount: includedTravelDiscount,
      detailedPricePerPerson: detailedPricePerPerson,
      appliedTravelDiscount: appliedTravelDiscount,
    );
  }

  factory BestOfferModel.fromEntity(BestOffer? bestOffer) {
    if (bestOffer == null) {
      return BestOfferModel(
        travelDate: TravelDateModel(
          days: 0,
          departureDate: '',
          nights: 0,
          returnDate: '',
        ),
        rooms: RoomsModel(
          overall: OverallModel(
            attributes: [],
            boarding: '',
            name: '',
            adultCount: 0,
            childrenCount: 0,
            childrenAges: [],
            quantity: 0,
            sameBoarding: false,
            sameRoomGroups: false,
          ),
          pricesAndOccupancy: [],
          roomGroups: [],
        ),
        flightIncluded: false,
        availableSpecialGroups: [],
        travelPrice: 0.0,
        total: 0.0,
        simplePricePerPerson: 0.0,
        originalTravelPrice: 0.0,
        includedTravelDiscount: 0.0,
        detailedPricePerPerson: [],
      );
    }
    return BestOfferModel(
      travelDate: TravelDateModel.fromEntity(bestOffer.travelDate),
      rooms: RoomsModel.fromEntity(bestOffer.rooms),
      flightIncluded: bestOffer.flightIncluded,
      availableSpecialGroups: bestOffer.availableSpecialGroups,
      travelPrice: bestOffer.travelPrice,
      total: bestOffer.total,
      simplePricePerPerson: bestOffer.simplePricePerPerson,
      originalTravelPrice: bestOffer.originalTravelPrice,
      includedTravelDiscount: bestOffer.includedTravelDiscount,
      detailedPricePerPerson: bestOffer.detailedPricePerPerson,
      appliedTravelDiscount: bestOffer.appliedTravelDiscount ?? '',
    );
  }
}
