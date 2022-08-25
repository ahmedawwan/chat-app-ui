import 'package:flutter/material.dart';
import '../../../models/chat_message_model.dart';
import '../utilities/app_fonts.dart';
import '../widgets/app_bar.dart';

class SingleChat extends StatefulWidget {
  const SingleChat({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<SingleChat> createState() => _SingleChatState();
}

class _SingleChatState extends State<SingleChat> {
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hello",
        messageType: "receiver",
        messageTime: '05:39PM'),
    ChatMessage(
        messageContent: "How have you been?",
        messageType: "receiver",
        messageTime: '05:39PM'),
    ChatMessage(
        messageContent: "Hey, I am doing fine dude. wbu?",
        messageType: "sender",
        messageTime: '05:41PM'),
    ChatMessage(
        messageContent: "doing OK.",
        messageType: "receiver",
        messageTime: '05:42PM'),
    ChatMessage(
        messageContent: "Is there any thing wrong?",
        messageType: "sender",
        messageTime: '05:45PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: CustomAppBar(
          title: widget.name,
          iconSize: 14,
          leadingButtonIcon: Icons.arrow_back_ios_new,
          leadingOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: (messages[index].messageType == "receiver"
                            ? Theme.of(context).primaryColor
                            : const Color(0xfff9f9f9)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1.0,
                            blurRadius: 30.0,
                            offset: const Offset(0.0, 1),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent!,
                        style: (messages[index].messageType == "receiver"
                            ? kFont14ptWhite
                            : kFont14pt),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // ===========================================================
          // Bottom Text Box
          // ===========================================================
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 35, left: 20, right: 20),
              padding: const EdgeInsets.all(10),
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xfff9f9f9),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: const Color(0xffcecece)),
              ),
              child: Row(
                children: <Widget>[
                  // ===========================================================
                  // Add Button
                  // ===========================================================
                  messageBoxButton(context, const Color(0xfff9f9f9),
                      const Color(0xffababab), Icons.add),

                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: kTextFieldHint,
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Row(
                    children: [
                      messageBoxButton(context, const Color(0xfff9f9f9),
                          const Color(0xffababab), Icons.mic),
                      const SizedBox(
                        width: 6,
                      ),
                      messageBoxButton(context, Theme.of(context).primaryColor,
                          Colors.white, Icons.send),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector messageBoxButton(BuildContext context, Color iconBgColor,
      Color iconColor, IconData iconData) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: const Color(0xffcecece))),
        child: Icon(
          iconData,
          color: iconColor,
          size: 20,
        ),
      ),
    );
  }
}