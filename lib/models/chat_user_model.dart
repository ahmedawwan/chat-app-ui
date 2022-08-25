import 'package:flutter/cupertino.dart';

class ChatUsers {
  final String? name;
  final String? messageText;
  //final String? imageURL;
  final String? time;

  ChatUsers({
    @required this.name,
    @required this.messageText,
    // @required this.imageURL,
    @required this.time,
  });
}
