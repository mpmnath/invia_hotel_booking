import 'package:hive/hive.dart';
import 'package:invia_hotel_booking/core/data/models/hotel_model.dart';
import 'package:invia_hotel_booking/core/data/models/image_model.dart';
import 'package:invia_hotel_booking/core/data/models/price_and_occupancy_model.dart';
import 'package:invia_hotel_booking/core/data/models/rating_model.dart';
import 'package:invia_hotel_booking/core/data/models/best_offer_model.dart';
import 'package:invia_hotel_booking/core/data/models/overall_model.dart';
import 'package:invia_hotel_booking/core/data/models/room_groups_model.dart';
import 'package:invia_hotel_booking/core/data/models/rooms_model.dart';
import 'package:invia_hotel_booking/core/data/models/travel_date_model.dart';

class HiveInitializer {
  static void registerAdapters() {
    Hive.registerAdapter(HotelModelAdapter());
    Hive.registerAdapter(ImageModelAdapter());
    Hive.registerAdapter(RatingModelAdapter());
    Hive.registerAdapter(BestOfferModelAdapter());
    Hive.registerAdapter(OverallModelAdapter());
    Hive.registerAdapter(PricesAndOccupancyModelAdapter());
    Hive.registerAdapter(RoomGroupsModelAdapter());
    Hive.registerAdapter(RoomsModelAdapter());
    Hive.registerAdapter(TravelDateModelAdapter());
  }
}
