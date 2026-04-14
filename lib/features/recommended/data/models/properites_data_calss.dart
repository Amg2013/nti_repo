import 'package:flutter/material.dart';
import 'package:nti_repo/features/recommended/ui/widgets/properite_item.dart';

class ProperitesDataCalss {
  String title;
  String location;
  String? price;
  int? beds;
  int? baths;
  int? area;
  double? rating;

  ProperitesDataCalss({
    required this.title,
    required this.location,
    this.price,
    this.beds,
    this.baths,
    this.area,
    this.rating,
  });

  factory ProperitesDataCalss.fromMap(Map<String, dynamic> map) {
    return ProperitesDataCalss(
      title: map['title'],
      location: map['location'],
      price: map['price'],
      beds: map['beds'],
      baths: map['baths'],
    );
  }

  factory ProperitesDataCalss.home() {
    return ProperitesDataCalss(
      title: 'Palm Residence Apartment',
      location: 'Downtown, Cairo',
      price: '1499',
    );
  }
}
