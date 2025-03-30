// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestOfferModel _$BestOfferModelFromJson(Map<String, dynamic> json) =>
    BestOfferModel(
      travelDate: TravelDateModel.fromJson(
        json['travel-date'] as Map<String, dynamic>,
      ),
      rooms: RoomsModel.fromJson(json['rooms'] as Map<String, dynamic>),
      flightIncluded: json['flight-included'] as bool,
      availableSpecialGroups:
          (json['available-special-groups'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      travelPrice: (json['travel-price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      simplePricePerPerson: (json['simple-price-per-person'] as num).toDouble(),
      originalTravelPrice: (json['original-travel-price'] as num).toDouble(),
      includedTravelDiscount:
          (json['included-travel-discount'] as num).toDouble(),
      detailedPricePerPerson:
          (json['detailed-price-per-person'] as List<dynamic>)
              .map((e) => (e as num).toDouble())
              .toList(),
      appliedTravelDiscount: json['applied-travel-discount'] as String?,
    );

Map<String, dynamic> _$BestOfferModelToJson(BestOfferModel instance) =>
    <String, dynamic>{
      'travel-date': instance.travelDate,
      'rooms': instance.rooms,
      'flight-included': instance.flightIncluded,
      'available-special-groups': instance.availableSpecialGroups,
      'travel-price': instance.travelPrice,
      'total': instance.total,
      'simple-price-per-person': instance.simplePricePerPerson,
      'original-travel-price': instance.originalTravelPrice,
      'included-travel-discount': instance.includedTravelDiscount,
      'detailed-price-per-person': instance.detailedPricePerPerson,
      'applied-travel-discount': instance.appliedTravelDiscount,
    };
