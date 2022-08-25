import 'package:flutter/material.dart';
import 'package:projects/widgets/search_text_field.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_fonts.dart';

class FloatingAppBar extends StatefulWidget {
  const FloatingAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leadingIcon = Icons.arrow_back_ios_new,
    this.iconSize = 14,
    this.leadingOnPressed,
  }) : super(key: key);

  final String title;
  final List<Map<String, dynamic>>? actions;
  final IconData leadingIcon;
  final double iconSize;
  final Function? leadingOnPressed;

  @override
  State<FloatingAppBar> createState() => _FloatingAppBarState();
}

class _FloatingAppBarState extends State<FloatingAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: kAppBgColor,
      pinned: true,
      floating: true,
      expandedHeight: 120.0,
      title: Text(
        widget.title,
        style: kFont18ptBold,
      ),
      leadingWidth: 55.0,
      leading: Container(
        margin: const EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
            color: const Color(0xfff9f9f9),
            border: Border.all(
              color: const Color(0xffDBDBDB),
            ),
            shape: BoxShape.circle),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          iconSize: widget.iconSize,
          // Leading Icon
          icon: Icon(
            widget.leadingIcon,
            color: Colors.black,
          ),
          //leading on pressed
          onPressed: () {
            // widget.leadingOnPressed != null
            //     ? widget.leadingOnPressed!()
            //     : Navigator.pop(context);
          },
        ),
      ),
      actions: widget.actions != null
          ? [
              ...widget.actions!
                  .map(
                    (element) => _customTrailingButton(
                      element['icon'],
                      element['onPressed'],
                    ),
                  )
                  .toList(),
              const SizedBox(
                width: 20,
              ),
            ]
          : null,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(68),
        child: Padding(
          padding:  EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child:  SearchBar(),
        ),
      ),
    );
  }

  Container _customTrailingButton(dynamic iconData, dynamic onPressed) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 35, maxWidth: 35),
      margin: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
          color: const Color(0xfff9f9f9),
          border: Border.all(
            color: const Color(0xffDBDBDB),
          ),
          shape: BoxShape.circle),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        iconSize: 20.0,
        icon: Icon(
          iconData,
          color: Colors.black,
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
