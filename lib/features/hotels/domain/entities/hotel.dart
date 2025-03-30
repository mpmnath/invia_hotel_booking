import 'package:equatable/equatable.dart';

class Image {
  final String large;
  final String small;

  const Image({required this.large, required this.small});
}

class Rating {
  final double score;
  final String scoreDescription;
  final int reviewsCount;
  final double recommendationRate;

  const Rating({
    required this.score,
    required this.scoreDescription,
    required this.reviewsCount,
    required this.recommendationRate,
  });
}

class Rooms {
  final Overall overall;
  final List<PricesAndOccupancy> pricesAndOccupancy;
  final List<RoomGroups> roomGroups;

  const Rooms({
    required this.overall,
    required this.pricesAndOccupancy,
    required this.roomGroups,
  });
}

class Overall {
  final List<String> attributes;
  final String boarding;
  final String name;
  final int adultCount;
  final int childrenCount;
  final List<int> childrenAges;
  final int quantity;
  final bool sameBoarding;
  final bool sameRoomGroups;

  const Overall({
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
}

class PricesAndOccupancy {
  final int adultCount;
  final List<int> childrenAges;
  final int childrenCount;
  final List<double> detailedPricePerPerson;
  final String groupIdentifier;
  final double simplePricePerPerson;
  final double total;

  const PricesAndOccupancy({
    required this.adultCount,
    required this.childrenAges,
    required this.childrenCount,
    required this.detailedPricePerPerson,
    required this.groupIdentifier,
    required this.simplePricePerPerson,
    required this.total,
  });
}

class RoomGroups {
  final List<String> attributes;
  final String boarding;
  final String name;
  final String detailedDescription;
  final String groupIdentifier;
  final int quantity;

  const RoomGroups({
    required this.attributes,
    required this.boarding,
    required this.name,
    required this.detailedDescription,
    required this.groupIdentifier,
    required this.quantity,
  });
}

class TravelDate {
  final int days;
  final String departureDate;
  final int nights;
  final String returnDate;

  const TravelDate({
    required this.days,
    required this.departureDate,
    required this.nights,
    required this.returnDate,
  });
}

class BestOffer {
  final TravelDate travelDate;
  final Rooms rooms;
  final bool flightIncluded;
  final List<String> availableSpecialGroups;
  final double travelPrice;
  final double total;
  final double simplePricePerPerson;
  final double originalTravelPrice;
  final double includedTravelDiscount;
  final List<double> detailedPricePerPerson;
  final String? appliedTravelDiscount;

  const BestOffer({
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

  double get totalPrice => total;
}

class Hotel extends Equatable {
  final String id;
  final String name;
  final String destination;
  final double category;
  final String categoryType;
  final double latitude;
  final double longitude;
  final List<Image> images;
  final Rating? rating;
  final BestOffer? bestOffer;

  const Hotel({
    required this.id,
    required this.name,
    required this.destination,
    required this.category,
    required this.categoryType,
    required this.latitude,
    required this.longitude,
    required this.images,
    this.rating,
    this.bestOffer,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    destination,
    category,
    latitude,
    longitude,
  ];

  // Helper method to get the first image or a default
  String get mainImage {
    if (images.isNotEmpty) {
      return images.first.large;
    }
    return '';
  }

  // Helper method to get the rating score or a default
  double get ratingScore {
    return rating?.score ?? 0.0;
  }

  // Helper method to get the price or a default
  double get price {
    return bestOffer?.totalPrice ?? 0.0;
  }
}
