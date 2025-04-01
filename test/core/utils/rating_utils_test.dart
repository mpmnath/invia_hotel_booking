import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invia_hotel_booking/core/utils/rating_utils.dart';

void main() {
  group('RatingUtils', () {
    group('getSentimentColor', () {
      test('returns green color for score >= 4.4', () {
        expect(RatingUtils.getSentimentColor(4.5), const Color(0xFF00A54C));
      });

      test('returns light green color for score >= 4.1', () {
        expect(RatingUtils.getSentimentColor(4.2), const Color(0xFF85BC39));
      });

      test('returns yellow color for score >= 3.8', () {
        expect(RatingUtils.getSentimentColor(3.9), const Color(0xFFC3C718));
      });

      test('returns orange color for score >= 3.5', () {
        expect(RatingUtils.getSentimentColor(3.6), const Color(0xFFF6AD2C));
      });

      test('returns dark orange color for score < 3.5', () {
        expect(RatingUtils.getSentimentColor(3.4), const Color(0xFFDF7400));
      });
    });

    group('getSentimentIcon', () {
      test('returns very satisfied icon for score >= 4.4', () {
        expect(
          RatingUtils.getSentimentIcon(4.5),
          Icons.sentiment_very_satisfied,
        );
      });

      test('returns satisfied alt icon for score >= 4.1', () {
        expect(
          RatingUtils.getSentimentIcon(4.2),
          Icons.sentiment_satisfied_alt,
        );
      });

      test('returns satisfied icon for score >= 3.8', () {
        expect(RatingUtils.getSentimentIcon(3.9), Icons.sentiment_satisfied);
      });

      test('returns dissatisfied icon for score >= 3.5', () {
        expect(RatingUtils.getSentimentIcon(3.6), Icons.sentiment_dissatisfied);
      });

      test('returns very dissatisfied icon for score < 3.5', () {
        expect(
          RatingUtils.getSentimentIcon(3.4),
          Icons.sentiment_very_dissatisfied,
        );
      });
    });
  });
}
