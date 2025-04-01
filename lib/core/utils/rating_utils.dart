import 'package:flutter/material.dart';

class RatingUtils {
  static Color getSentimentColor(double score) {
    if (score >= 4.4) {
      return const Color(0xFF00A54C);
    } else if (score >= 4.1) {
      return const Color(0xFF85BC39);
    } else if (score >= 3.8) {
      return const Color(0xFFC3C718);
    } else if (score >= 3.5) {
      return const Color(0xFFF6AD2C);
    } else {
      return const Color(0xFFDF7400);
    }
  }

  static IconData getSentimentIcon(double score) {
    if (score >= 4.4) {
      return Icons.sentiment_very_satisfied;
    } else if (score >= 4.1) {
      return Icons.sentiment_satisfied_alt;
    } else if (score >= 3.8) {
      return Icons.sentiment_satisfied;
    } else if (score >= 3.5) {
      return Icons.sentiment_dissatisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }
}
