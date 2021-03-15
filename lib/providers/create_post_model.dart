import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yoboshu/providers/feed_model.dart';
import 'package:yoboshu/providers/feed_provider.dart';

class CreatePostData extends ChangeNotifier {
  final _communitiesList = [
    "Nutrition",
    "Yoga",
    "Weight Management",
    "Workout",
    "Food Talks",
    "Self Defence",
    "Recipes",
    "Meditation",
    "Yoboshu",
    "LifeStyle Diseases",
    "Personal Training",
    "Fitness",
    "Chronic Diseases",
    "Health & Fitness Goals",
    "Health & Wellness News",
    "Get Motivated",
    "Humour for Health",
    "Women Health & Problems"
  ];

  File _image;

  List<String> get communitiesList => _communitiesList;

  File get pickedImage => _image;

  set deallocate(value) {
    _image = value;
  }

  void uploadImage(BuildContext context) async {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            optionsToUpload(width / 2, 80, "Camera", context),
            optionsToUpload(width / 2, 80, "Gallery", context),
          ],
        ),
      ),
    );
  }

  Widget optionsToUpload(
      double width, double height, String option, BuildContext context) {
    return InkWell(
        onTap: () async {
          Navigator.pop(context);
          final picker = ImagePicker();
          final pickedFile = await picker.getImage(
              source:
                  option == "Camera" ? ImageSource.camera : ImageSource.gallery,
              imageQuality: 30);

          if (pickedFile != null) {
            _image = File(pickedFile.path);
            print(pickedFile.path);
          } else {
            print('No image selected.');
          }
          notifyListeners();
        },
        child: Container(
            height: 80,
            width: width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  option == "Camera" ? Icons.camera : Icons.photo,
                  size: 30,
                ),
                Text(option)
              ],
            )));
  }

  void postFeed(String postType, String userName, String community,
      String title, String caption, BuildContext context, FeedProvider prov) {
    if (postType == "Image" &&
        community != null &&
        title.length > 0 &&
        _image.path.length > 0) {
      prov.addNewFeed(FeedModel(
          userID: "5",
          userName: userName,
          caption: caption,
          commentCount: 0,
          communtiy: community,
          dateTime: DateTime.now(),
          feedTitle: title,
          gritCompleted: false,
          gritCount: 0,
          imageURL: _image.path,
          inspiredCompleted: false,
          inspiredCount: 0,
          isAnonymous: userName != "Anonymous" ? false : true,
          postType: postType,
          userPic: "assets/images/user3.jpg"));
      cleanAndUpdate(context);
    } else if (postType == "Text" && community != null && title.length > 0) {
      prov.addNewFeed(FeedModel(
          userID: "5",
          userName: userName,
          caption: caption,
          commentCount: 0,
          communtiy: community,
          dateTime: DateTime.now(),
          feedTitle: title,
          gritCompleted: false,
          gritCount: 0,
          imageURL: null,
          inspiredCompleted: false,
          inspiredCount: 0,
          isAnonymous: userName != "Anonymous" ? false : true,
          postType: postType,
          userPic: "assets/images/user3.jpg"));
      cleanAndUpdate(context);
    } else if (postType == "Link" &&
        community != null &&
        title.length > 0 &&
        caption != null) {
      prov.addNewFeed(FeedModel(
          userID: "5",
          userName: userName,
          caption: caption,
          commentCount: 0,
          communtiy: community,
          dateTime: DateTime.now(),
          feedTitle: title,
          gritCompleted: false,
          gritCount: 0,
          imageURL: null,
          inspiredCompleted: false,
          inspiredCount: 0,
          isAnonymous: userName != "Anonymous" ? false : true,
          postType: postType,
          userPic: "assets/images/user3.jpg"));
      cleanAndUpdate(context);
    } else
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Missing Values"),
            content: Text(
              postType == "Image"
                  ? "Title, image and community cannot be empty."
                  : (postType == "Text"
                      ? "Title and community cannot be empty"
                      : "Title, community and link cannot be empty"),
            ),
            actionsPadding: EdgeInsets.zero,
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Continue"))
            ],
          );
        },
      );
  }

  void cleanAndUpdate(BuildContext context) {
    Navigator.of(context).pop();
    _image = null;
    Future.delayed(const Duration(seconds: 2), () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Center(child: Text("Posted")),
          );
        },
      );
    });
  }
}
