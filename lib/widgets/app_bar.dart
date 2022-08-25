import 'package:flutter/material.dart';
import '../../utilities/app_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    required this.leadingButtonIcon,
    this.iconBgcolor = const Color(0xfff9f9f9),
    this.bgColor = const Color(0xffF2F2F2),
    this.iconBorderColor = const Color(0xffDBDBDB),
    this.tabBar,
    this.actions,
    required this.leadingOnPressed,
    this.iconSize = 20,
  }) : super(key: key);

  final String? title;
  final IconData leadingButtonIcon;
  final Function leadingOnPressed;
  final Color iconBgcolor;
  final Color? bgColor;
  final Color iconBorderColor;
  final PreferredSize? tabBar;
  final List<Map<String, dynamic>>? actions;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0.0,
      // =========================================================
      // Title
      // =========================================================
      title: title != null
          ? Text(
              title!,
              style: kFont18ptBold,
            )
          : null,
      centerTitle: true,
      leadingWidth: 55.0,
      // =========================================================
      // Leading
      // =========================================================
      leading: _customLeadingButton(leadingButtonIcon, leadingOnPressed),
      // =========================================================
      // Actions
      // =========================================================
      //actions: actionButtons,
      actions: actions != null
          ? [
              ...actions!
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
      // =========================================================
      // Tab Bar
      // =========================================================
      bottom: tabBar,
    );
  }

  Container _customLeadingButton(dynamic iconData, dynamic onPressed) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: iconBgcolor,
          border: Border.all(
            color: iconBorderColor,
          ),
          shape: BoxShape.circle),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        iconSize: iconSize,
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

  Container _customTrailingButton(dynamic iconData, dynamic onPressed) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 35, maxWidth: 35),
      margin: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
          color: iconBgcolor,
          border: Border.all(
            color: iconBorderColor,
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
