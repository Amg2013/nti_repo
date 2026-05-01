import 'package:flutter/material.dart';

class FeedCardData {
  final String image;
  final String category;
  final Color categoryColor;
  final String title;
  final String description;
  final int targetAmount;
  final int collectedAmount;
  final int daysRemaining;
  final VoidCallback? onDonate;

  FeedCardData({
    required this.image,
    required this.category,
    required this.categoryColor,
    required this.title,
    required this.description,
    required this.targetAmount,
    required this.collectedAmount,
    required this.daysRemaining,
    this.onDonate,
  });
}
