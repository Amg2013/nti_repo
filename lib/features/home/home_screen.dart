import 'package:flutter/material.dart';
import 'package:nti_repo/core/widgets/app_button.dart';
import 'package:nti_repo/features/home/data/feed_data_class.dart';
import 'package:nti_repo/features/home/feed_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Welcome to the Home Screen!'),

            AppButton(
              text: 'Click Me',
              onPressed: () {
                // Handle button press
              },
            ),
            // SizedBox(
            //   height: 200,
            //   child: Card(
            //     margin: const EdgeInsets.all(16),
            //     child: Padding(
            //       padding: const EdgeInsets.all(16.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Card Title nnnnnnnn nnnnnnnn. nnnnn',
            //             style: Theme.of(context).textTheme.bodyLarge!,
            //           ),
            //           const SizedBox(height: 8),
            //           Text(
            //             'This is a description of the card content.',
            //             style: Theme.of(context).textTheme.bodySmall!,
            //           ),

            //           AppButton(
            //             text: 'Learn More',
            //             onPressed: () {
            //               // Handle button press
            //             },
            //             showHeartIcon: false,
            //             fontSize: 14,
            //             padding: const EdgeInsets.symmetric(
            //               horizontal: 12,
            //               vertical: 8,
            //             ),
            //           ),
            SizedBox(
              height: 600,
              width: double.infinity,
              child: FeedWidget(
                cards: [
                  FeedCardData(
                    image: 'image',
                    category: 'category',
                    categoryColor: Colors.blue,
                    title: 'title',
                    description: 'description',
                    targetAmount: 1000,
                    collectedAmount: 500,
                    daysRemaining: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
