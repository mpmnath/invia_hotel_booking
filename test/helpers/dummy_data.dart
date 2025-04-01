import 'package:invia_hotel_booking/core/domain/entities/hotel.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';

final dummyHotel = Hotel(
  id: '1',
  name: 'Test Hotel',
  destination: 'Mallorca',
  category: 5,
  categoryType: 'stars',
  latitude: 0.0,
  longitude: 0.0,
  images: [],
  rating: null,
  bestOffer: BestOffer(
    travelDate: TravelDate(
      days: 8,
      departureDate: '2025-05-01',
      nights: 7,
      returnDate: '2025-05-08',
    ),
    rooms: Rooms(
      overall: Overall(
        attributes: [],
        boarding: 'Breakfast',
        name: 'Double Room',
        adultCount: 2,
        childrenCount: 0,
        childrenAges: [],
        quantity: 1,
        sameBoarding: true,
        sameRoomGroups: false,
      ),
      pricesAndOccupancy: [],
      roomGroups: [],
    ),
    flightIncluded: false,
    availableSpecialGroups: [],
    travelPrice: 1000,
    total: 2000,
    simplePricePerPerson: 500,
    originalTravelPrice: 1200,
    includedTravelDiscount: 200,
    detailedPricePerPerson: [500, 500],
    appliedTravelDiscount: '10%',
  ),
);

final dummyHotelModel = HotelModel.fromEntity(dummyHotel);
