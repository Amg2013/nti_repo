import 'package:flutter/material.dart';
import 'package:nti_repo/features/recommended/data/models/properites_data_calss.dart';
import 'package:nti_repo/features/recommended/ui/widgets/properite_item.dart';

class RecommedndProperites extends StatefulWidget {
  const RecommedndProperites({super.key});

  @override
  State<RecommedndProperites> createState() => _RecommedndProperitesState();
}

class _RecommedndProperitesState extends State<RecommedndProperites> {
  final List<Map<String, dynamic>> _items = const [
    {
      'title': 'Palm Residence Apartment',
      'location': 'Downtown, Cairo',
      'price': 1499,
      'beds': 3,
      'baths': 2,
      'area': 1450,
      'featured': true,
    },
    {
      'title': 'Garden View Loft',
      'location': 'New Cairo, Fifth Settlement',
      'price': 1190,
      'beds': 2,
      'baths': 2,
      'area': 1020,
      'featured': false,
    },
    {
      'title': 'Sunset Family Villa',
      'location': 'Sheikh Zayed, Giza',
      'price': 2399,
      'beds': 4,
      'baths': 3,
      'area': 2200,
      'featured': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Properties'),
        centerTitle: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7FAF8), Color(0xFFFFFFFF)],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: 3,
          itemBuilder: (context, index) {
            // final item = _items[index];

            var item = ProperitesDataCalss(
              title: 'title',
              location: 'location',
              price: '1499',
              beds: 3,
              baths: 2,
            );

            ////

            return ProperiteItemWidget(
              isFeatured: true,
              area: 20,
              beds: 20,
              baths: 20,
              location: 'afdfasd',
              title: 'tetrqewt',
              price: 8888,
              // isFeatured: item.featured,
              onTap: () {
                // Handle item tap
              },
            );
          },
        ),
      ),
    );
  }
}
