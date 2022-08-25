import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';
import '../utilities/app_fonts.dart';

class ConversationList extends StatefulWidget {
  const ConversationList(
      {Key? key,
      this.name,
      this.messageText,
      this.time,
      this.isMessageRead,
      this.chat})
      : super(key: key);

  final String? name;
  final String? messageText;
  //final String? imageUrl;
  final String? time;
  final bool? isMessageRead;
  final Function? chat;

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.chat!();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: widget.isMessageRead! ? Colors.white : kAppBgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  //User Image
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    // child: Image.asset('assets/images/onboarding1.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //User Name
                          Text(
                            widget.name!,
                            style: widget.isMessageRead!
                                ? kFont16ptBold
                                : kFont16pt,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          //User Message
                          Text(
                            widget.messageText!,
                            style: kFont14pt,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Time of message
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.time!,
                  style: widget.isMessageRead! ? kFont14ptBold : kFont14pt,
                ),
                widget.isMessageRead!
                    ? Container(
                        margin: const EdgeInsets.only(top: 0),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,),
                        child: Center(
                          child: Text(
                            '3',
                            style: kFont12ptWhite,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
