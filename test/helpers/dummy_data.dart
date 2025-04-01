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

final rawHotelData = {
  'hotel-id': '1',
  'name': 'Test Hotel',
  'destination': 'Mallorca',
  'category': 5,
  'category-type': 'star',
  'latitude': 0.0,
  'longitude': 0.0,
  'images': [
    {'large': 'url1', 'small': 'url2'},
  ],
  'rating-info': {
    'score': 5.0,
    'score-description': 'Excellent',
    'reviews-count': 200,
    'recommendation-rate': 95.0,
  },
  'best-offer': {
    'travel-date': {
      'days': 7,
      'departure-date': '2025-01-01',
      'nights': 6,
      'return-date': '2025-01-07',
    },
    'rooms': {
      'overall': {
        'attributes': [],
        'boarding': '',
        'name': '',
        'adult-count': 2,
        'children-count': 0,
        'children-ages': [],
        'quantity': 1,
        'same-boarding': true,
        'same-room-groups': true,
      },
      'prices-and-occupancy': [],
      'room-groups': [],
    },
    'flight-included': true,
    'available-special-groups': [],
    'travel-price': 1000.0,
    'total': 1000.0,
    'simple-price-per-person': 500.0,
    'original-travel-price': 1200.0,
    'included-travel-discount': 200.0,
    'detailed-price-per-person': [500.0, 500.0],
    'applied-travel-discount': '',
  },
};
