import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoboshu/providers/create_post_model.dart';
import 'package:yoboshu/providers/feed_provider.dart';
import 'package:yoboshu/providers/navigation_provider.dart';
import 'package:yoboshu/widgets/screen_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
            create: (ctx) => NavigationProvider()),
        ChangeNotifierProvider<FeedProvider>(
          create: (ctx) => FeedProvider(),
        ),
        ChangeNotifierProvider<CreatePostData>(
            create: (ctx) => CreatePostData())
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: ScreenController(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
