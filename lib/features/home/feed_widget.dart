import 'package:flutter/material.dart';
import 'package:nti_repo/features/home/card_feed_widget.dart';
import 'package:nti_repo/features/home/data/feed_data_class.dart';
import 'package:nti_repo/utils/app_colors.dart';

/// Feed Widget - displays a list of donation cards
class FeedWidget extends StatelessWidget {
  final List<FeedCardData> cards;
  final ScrollController? scrollController;

  const FeedWidget({super.key, required this.cards, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder:
          (context, index) => FeedCard(
            image: cards[index].image,
            category: cards[index].category,
            categoryColor: cards[index].categoryColor,
            title: cards[index].title,
            description: cards[index].description,
            targetAmount: cards[index].targetAmount,
            collectedAmount: cards[index].collectedAmount,
            daysRemaining: cards[index].daysRemaining,
            onDonate: cards[index].onDonate,
          ),
    );
  }

  /*


.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return FeedCard(
          image: card.image,
          category: card.category,
          categoryColor: card.categoryColor,
          title: card.title,
          description: card.description,
          targetAmount: card.targetAmount,
          collectedAmount: card.collectedAmount,
          daysRemaining: card.daysRemaining,
          onDonate: card.onDonate,
        );
      },
*/
}
