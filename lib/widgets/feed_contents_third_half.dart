import 'package:flutter/material.dart';
import 'package:yoboshu/providers/feed_provider.dart';

class FeedContentsThirdHalf extends StatelessWidget {
  const FeedContentsThirdHalf({
    Key key,
    @required this.provider,
    @required this.currentIndex,
  }) : super(key: key);

  final FeedProvider provider;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => provider.gritCount(currentIndex),
            child: Row(
              children: [
                Container(
                    width: 40,
                    height: 30,
                    padding: EdgeInsets.all(2),
                    child:
                        provider.feedsList[currentIndex].gritCompleted == false
                            ? Image.asset("assets/images/fist.png")
                            : Image.asset("assets/images/fist-colored.png")),
                Text(
                  "  Grit  ${provider.feedsList[currentIndex].gritCount}",
                  style: TextStyle(
                      color:
                          provider.feedsList[currentIndex].inspiredCompleted ==
                                  false
                              ? Colors.black87
                              : Color(0xff050069),
                      fontSize: 13),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => provider.inspiredCount(currentIndex),
            child: Row(
              children: [
                Container(
                    width: 40,
                    height: 30,
                    padding: EdgeInsets.all(2),
                    child: provider.feedsList[currentIndex].inspiredCompleted ==
                            false
                        ? Image.asset("assets/images/flash.png")
                        : Image.asset("assets/images/flash-colored.png")),
                Text(
                  "  Inspired  ${provider.feedsList[currentIndex].inspiredCount}",
                  style: TextStyle(
                      color:
                          provider.feedsList[currentIndex].inspiredCompleted ==
                                  false
                              ? Colors.black87
                              : Colors.blue[500],
                      fontSize: 13),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  width: 40,
                  height: 30,
                  padding: EdgeInsets.all(4),
                  child: Image.asset("assets/images/chat.png")),
              Text(
                "   ${provider.feedsList[currentIndex].commentCount}",
                style: TextStyle(color: Colors.black87, fontSize: 13),
              ),
            ],
          ),
          GestureDetector(
            onTap: () =>
                provider.share(provider.feedsList[currentIndex].feedTitle),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(width: 40, height: 30, child: Icon(Icons.share)),
            ),
          )
        ],
      ),
    );
  }
}
