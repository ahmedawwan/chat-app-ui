import 'package:flutter/material.dart';
import 'package:projects/views/single_chat.dart';
import '../../../models/chat_user_model.dart';
import '../../../widgets/conversation_list.dart';
import '../widgets/app_bar_floating.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key? key}) : super(key: key);

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", time: "Now"),
    ChatUsers(
        name: "Glady's Murphy", messageText: "That's Great", time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry", messageText: "Hey where are you?", time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const FloatingAppBar(title: 'Messaging'),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                ListView.builder(
                  itemCount: chatUsers.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ConversationList(
                      name: chatUsers[index].name,
                      messageText: chatUsers[index].messageText,
                      // imageUrl: chatUsers[index].imageURL,
                      time: chatUsers[index].time,
                      isMessageRead: (index == 0 || index == 1) ? true : false,
                      chat: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleChat(
                              name: chatUsers[index].name!,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
