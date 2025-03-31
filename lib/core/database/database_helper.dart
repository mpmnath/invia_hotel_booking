import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

@singleton
class DatabaseHelper {
  static const String databaseName = 'hotel_booking.db';
  static const int databaseVersion = 1;

  // Table names
  static const String hotelTable = 'hotels';
  static const String imageTable = 'images';
  static const String ratingTable = 'ratings';
  static const String bestOfferTable = 'best_offers';
  static const String roomOverallTable = 'room_overalls';
  static const String travelDateTable = 'travel_dates';

  // Singleton pattern
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, databaseName);
    return await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create hotels table
    await db.execute('''
      CREATE TABLE $hotelTable (
        hotel_id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        destination TEXT NOT NULL,
        category REAL NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL
      )
    ''');

    // Create images table
    await db.execute('''
      CREATE TABLE $imageTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        hotel_id TEXT NOT NULL,
        large TEXT NOT NULL,
        small TEXT NOT NULL,
        FOREIGN KEY (hotel_id) REFERENCES $hotelTable (hotel_id) ON DELETE CASCADE
      )
    ''');

    // Create ratings table
    await db.execute('''
      CREATE TABLE $ratingTable (
        hotel_id TEXT PRIMARY KEY,
        score REAL NOT NULL,
        score_description TEXT NOT NULL,
        reviews_count INTEGER NOT NULL,
        recommendation_rate REAL NOT NULL,
        FOREIGN KEY (hotel_id) REFERENCES $hotelTable (hotel_id) ON DELETE CASCADE
      )
    ''');

    // Create best_offers table
    await db.execute('''
      CREATE TABLE $bestOfferTable (
        hotel_id TEXT PRIMARY KEY,
        total_price REAL NOT NULL,
        simple_price_per_person REAL NOT NULL,
        flight_included INTEGER NOT NULL,
        FOREIGN KEY (hotel_id) REFERENCES $hotelTable (hotel_id) ON DELETE CASCADE
      )
    ''');

    // Create room_overalls table
    await db.execute('''
      CREATE TABLE $roomOverallTable (
        hotel_id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        boarding TEXT NOT NULL,
        adult_count INTEGER NOT NULL,
        children_count INTEGER NOT NULL,
        quantity INTEGER NOT NULL,
        same_boarding_type INTEGER NOT NULL,
        same_room_groups INTEGER NOT NULL,
        FOREIGN KEY (hotel_id) REFERENCES $hotelTable (hotel_id) ON DELETE CASCADE
      )
    ''');

    // Create travel_dates table
    await db.execute('''
      CREATE TABLE $travelDateTable (
        hotel_id TEXT PRIMARY KEY,
        days INTEGER NOT NULL,
        departure_date TEXT NOT NULL,
        nights INTEGER NOT NULL,
        return_date TEXT NOT NULL,
        FOREIGN KEY (hotel_id) REFERENCES $hotelTable (hotel_id) ON DELETE CASCADE
      )
    ''');
  }

  // Helper method to close the database
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
