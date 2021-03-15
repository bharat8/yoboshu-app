import 'package:flutter/material.dart';
import 'package:yoboshu/widgets/communitites_widget.dart';
import 'package:yoboshu/widgets/create_post_widget.dart';
import 'package:yoboshu/widgets/feed_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    _controller = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications),
          )
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: <Tab>[
            Tab(
              text: "Feed",
            ),
            Tab(
              text: "Communities",
            ),
            Tab(
              text: "Create Post",
            )
          ],
        ),
      ),
      body: TabBarView(
          controller: _controller,
          children: <Widget>[Feed(), Communities(), CreatePost()]),
    );
  }
}
