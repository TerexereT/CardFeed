import 'package:feed_cards/widgets/cardfeed.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class ListCardFeed extends StatelessWidget {
  const ListCardFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listCard.length,
      itemBuilder: (context, i) {
        return Cardfeed(card: listCard[i]);
      },
    );
  }
}
