class FeedModel {
  final String userID;
  final String userName;
  final String userPic;
  final String communtiy;
  final DateTime dateTime;
  final String feedTitle;
  final String caption;
  final String imageURL;
  final String postType;
  final bool isAnonymous;
  int gritCount;
  int inspiredCount;
  int commentCount;
  bool gritCompleted;
  bool inspiredCompleted;

  FeedModel(
      {this.userID,
      this.userName,
      this.userPic,
      this.communtiy,
      this.dateTime,
      this.feedTitle,
      this.caption,
      this.imageURL,
      this.gritCount,
      this.inspiredCount,
      this.commentCount,
      this.gritCompleted,
      this.inspiredCompleted,
      this.postType,
      this.isAnonymous});
}
