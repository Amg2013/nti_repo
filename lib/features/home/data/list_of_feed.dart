import 'package:flutter/material.dart';
import 'package:nti_repo/features/home/data/feed_data_class.dart';

List<FeedCardData> testData = [
  FeedCardData(
    image: 'assets/images/food_donation.jpg',
    category: 'Food',
    categoryColor: Colors.orange,
    title: 'Food for the Hungry',
    description: 'Help us provide meals to those in need.',
    targetAmount: 10000,
    collectedAmount: 4500,
    daysRemaining: 15,
    onDonate: () {
      // Handle donation action
    },
  ),
  FeedCardData(
    image: 'assets/images/education_donation.jpg',
    category: 'Education',
    categoryColor: Colors.blue,
    title: 'Education for All',
    description: 'Support education initiatives for underprivileged children.',
    targetAmount: 20000,
    collectedAmount: 12000,
    daysRemaining: 30,
    onDonate: () {
      // Handle donation action
    },
  ),
];
