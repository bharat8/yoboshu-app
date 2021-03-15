import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:yoboshu/providers/feed_model.dart';

class FeedProvider extends ChangeNotifier {
  List<FeedModel> _feedsList = [
    FeedModel(
        userID: "1",
        userName: "Rahuri Bansal",
        userPic: "assets/images/user1.jpg",
        communtiy: "Nutrition",
        dateTime: DateTime(2021, 03, 16, 02, 23, 27),
        feedTitle: "Mushrooms",
        caption:
            "Mushroooms are the only non animal source of Vitamin D. They can server as a primary source of Vitamin D for vegeterians.",
        imageURL: "assets/images/1.jpg",
        gritCount: 1,
        inspiredCount: 1,
        commentCount: 0,
        gritCompleted: false,
        inspiredCompleted: false,
        isAnonymous: false,
        postType: "Image"),
    FeedModel(
        userID: "2",
        userName: "Bhanu Sharma",
        userPic: "assets/images/user2.jpg",
        communtiy: "Get Motivated",
        dateTime: DateTime(2021, 03, 15, 02, 23, 27),
        feedTitle: "Repeat this matnra to stay guilt free!",
        caption: "",
        imageURL: "assets/images/2.jpg",
        gritCount: 2,
        inspiredCount: 1,
        commentCount: 0,
        gritCompleted: false,
        inspiredCompleted: false,
        isAnonymous: false,
        postType: "Image"),
    FeedModel(
        userID: "3",
        userName: "Ashish Ranjan",
        userPic: "assets/images/user3.jpg",
        communtiy: "Health \$ Fitness Goals",
        dateTime: DateTime(2021, 01, 10, 02, 23, 27),
        feedTitle:
            "The deadlift is a weight training exercise in which a loaded barbell or bar is lifted off the ground to the level of the hips, torso perpendicular to the floor, before being placed. ",
        caption: "",
        imageURL: "assets/images/3.jpg",
        gritCount: 6,
        inspiredCount: 5,
        commentCount: 0,
        gritCompleted: false,
        inspiredCompleted: false,
        isAnonymous: false,
        postType: "Image"),
    FeedModel(
        userID: "4",
        userName: "Anshika Singh",
        userPic: "assets/images/user4.jpg",
        communtiy: "Fitness",
        dateTime: DateTime(2020, 03, 15, 02, 23, 27),
        feedTitle: "Negative pull ups",
        caption:
            "With negative pull ups how long should it take to achieve my first pull up? Should I do any other exercises first?",
        imageURL: null,
        gritCount: 2,
        inspiredCount: 1,
        commentCount: 0,
        gritCompleted: false,
        inspiredCompleted: false,
        isAnonymous: false,
        postType: "Text"),
  ];

  List<FeedModel> get feedsList => [..._feedsList];

  void gritCount(int index) {
    if (_feedsList[index].gritCompleted == false) {
      _feedsList[index].gritCount += 1;
    } else
      _feedsList[index].gritCount -= 1;

    _feedsList[index].gritCompleted = !_feedsList[index].gritCompleted;
    notifyListeners();
  }

  void inspiredCount(int index) {
    if (_feedsList[index].inspiredCompleted == false) {
      _feedsList[index].inspiredCount += 1;
    } else
      _feedsList[index].inspiredCount -= 1;
    _feedsList[index].inspiredCompleted = !_feedsList[index].inspiredCompleted;
    notifyListeners();
  }

  Future<void> share(String text) async {
    await Share.share("$text\nHere goes the url for post");
  }

  void addNewFeed(FeedModel model) {
    print("Called");
    _feedsList.insert(0, model);
    notifyListeners();
  }

  String checkTime(DateTime time) {
    var diff = DateTime.now().difference(time);
    if (diff.inDays > 30) {
      // check for months
      int months = -1;
      int years = -1;
      for (int i = 0; i < diff.inDays; i += 30) {
        months += 1;
      }
      //check for years
      if (months == 12) return "1 year ago";
      if (months > 12) {
        for (int k = 0; k < months; k += 12) {
          years += 1;
        }
        return "$years years ago";
      }
      return "$months months ago";
    } else if (diff.inDays == 30) {
      return "one month ago";
    } else if (diff.inDays > 0) {
      if (diff.inDays == 1)
        return "${diff.inDays} day ago";
      else
        return "${diff.inDays} days ago";
    } else if (diff.inHours > 0) {
      if (diff.inHours == 1)
        return "${diff.inHours} hour ago";
      else
        return "${diff.inHours} hours ago";
    } else if (diff.inMinutes > 0) {
      if (diff.inMinutes == 1)
        return "${diff.inMinutes} minute ago";
      else
        return "${diff.inMinutes} minutes ago";
    } else
      return "Posted just now";
  }
}
