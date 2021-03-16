import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoboshu/providers/feed_provider.dart';
import 'package:yoboshu/widgets/feed_contents.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffdedede).withOpacity(0.3),
      child: Consumer<FeedProvider>(
        builder: (BuildContext ctx, value, Widget child) => ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        offset: Offset.zero)
                  ]),
                  child: FeedContents(index, value),
                ));
          },
          itemCount: value.feedsList.length,
        ),
      ),
    );
  }
}
