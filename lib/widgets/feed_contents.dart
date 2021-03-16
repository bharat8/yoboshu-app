import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yoboshu/providers/feed_provider.dart';
import 'package:yoboshu/widgets/in_app_web_view.dart';

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage:
                      provider.feedsList[currentIndex].isAnonymous == false
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
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                            Text(
                              provider.feedsList[currentIndex].communtiy
                                  .toUpperCase(),
                              style: TextStyle(
                                  fontSize: 12, color: Colors.blue[200]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          provider.checkTime(
                              provider.feedsList[currentIndex].dateTime),
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                Text(
                  provider.feedsList[currentIndex].feedTitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: provider.feedsList[currentIndex].imageURL != null
                      ? Container(
                          margin: EdgeInsets.only(top: 10),
                          width: double.infinity,
                          height: 180,
                          color: Colors.black12,
                          child: provider.feedsList[currentIndex].userID != "5"
                              ? Image.asset(
                                  provider.feedsList[currentIndex].imageURL)
                              : Image.file(File(
                                  provider.feedsList[currentIndex].imageURL)))
                      : Container(),
                ),
                provider.feedsList[currentIndex].caption.length > 0
                    ? GestureDetector(
                        onTap: provider.feedsList[currentIndex].caption
                                .contains("https:")
                            ? () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => InAppWebViewWidget(provider
                                        .feedsList[currentIndex].caption)))
                            : () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            provider.feedsList[currentIndex].caption,
                            style: TextStyle(
                                color: provider.feedsList[currentIndex].caption
                                        .contains("https:")
                                    ? Colors.blue[900]
                                    : Colors.black87,
                                wordSpacing: 1.5),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            Padding(
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
                            child: provider.feedsList[currentIndex]
                                        .gritCompleted ==
                                    false
                                ? Image.asset("assets/images/fist.png")
                                : Image.asset(
                                    "assets/images/fist-colored.png")),
                        Text(
                          "  Grit  ${provider.feedsList[currentIndex].gritCount}",
                          style: TextStyle(
                              color: provider.feedsList[currentIndex]
                                          .inspiredCompleted ==
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
                            child: provider.feedsList[currentIndex]
                                        .inspiredCompleted ==
                                    false
                                ? Image.asset("assets/images/flash.png")
                                : Image.asset(
                                    "assets/images/flash-colored.png")),
                        Text(
                          "  Inspired  ${provider.feedsList[currentIndex].inspiredCount}",
                          style: TextStyle(
                              color: provider.feedsList[currentIndex]
                                          .inspiredCompleted ==
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
                    onTap: () => provider
                        .share(provider.feedsList[currentIndex].feedTitle),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          width: 40, height: 30, child: Icon(Icons.share)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
