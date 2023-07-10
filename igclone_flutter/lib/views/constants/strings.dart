import 'package:flutter/cupertino.dart';

@immutable
class Strings {
  static const appName = 'Instagram Clone';
  static const welcomeToAppName = 'Welcome to ${Strings.appName}';
  static const youHaveNoPosts =
      'You have not made a post yet. Press either the video-upload or the photo-upload buttons to the top of the screen in order to upload your first post!';
  static const noPostsAvailable =
      'Nobody seems to have made any posts yet. Why don\'t you take the first step and upload your first post?!';
  static const enterYourSearchTerm =
      'Enter your search term in order to get started. You can search in the description of all posts avaialable in the system';
  static const logIntoYourAccount =
      'Log into your account using one of the options below.';
  static const createNewPost = 'Create New Post';
  static const pleaseWriteYourMessageHere = 'Please write your message here';

  const Strings._();
}
