import 'package:flutter/material.dart';
import 'package:yoboshu/providers/feed_provider.dart';

class FeedContentsFirstHalf extends StatelessWidget {
  const FeedContentsFirstHalf({
    Key key,
    @required this.provider,
    @required this.currentIndex,
  }) : super(key: key);

  final FeedProvider provider;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: provider.feedsList[currentIndex].isAnonymous == false
              ? AssetImage(provider.feedsList[currentIndex].userPic)
              : AssetImage("assets/images/incognito.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  provider.feedsList[currentIndex].userName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Text(
                      "Posted in ",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    Text(
                      provider.feedsList[currentIndex].communtiy.toUpperCase(),
                      style: TextStyle(fontSize: 12, color: Colors.blue[200]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  provider.checkTime(provider.feedsList[currentIndex].dateTime),
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
