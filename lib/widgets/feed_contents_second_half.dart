import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yoboshu/providers/feed_provider.dart';
import 'package:yoboshu/widgets/in_app_web_view.dart';

class FeedContentsSecondHalf extends StatelessWidget {
  const FeedContentsSecondHalf({
    Key key,
    @required this.provider,
    @required this.currentIndex,
  }) : super(key: key);

  final FeedProvider provider;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      ? Image.asset(provider.feedsList[currentIndex].imageURL)
                      : Image.file(
                          File(provider.feedsList[currentIndex].imageURL)))
              : Container(),
        ),
        provider.feedsList[currentIndex].caption.length > 0
            ? GestureDetector(
                onTap:
                    provider.feedsList[currentIndex].caption.contains("https:")
                        ? () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => InAppWebViewWidget(
                                provider.feedsList[currentIndex].caption)))
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
    );
  }
}
