import 'package:flutter/material.dart';
import 'package:yoboshu/providers/feed_provider.dart';

import 'feed_contents_first_half.dart';
import 'feed_contents_second_half.dart';
import 'feed_contents_third_half.dart';

class FeedContents extends StatelessWidget {
  final int currentIndex;
  final FeedProvider provider;

  const FeedContents(this.currentIndex, this.provider);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            FeedContentsFirstHalf(
                provider: provider, currentIndex: currentIndex),
            Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            FeedContentsSecondHalf(
                provider: provider, currentIndex: currentIndex),
            Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            FeedContentsThirdHalf(
                provider: provider, currentIndex: currentIndex)
          ],
        ),
      ),
    );
  }
}
