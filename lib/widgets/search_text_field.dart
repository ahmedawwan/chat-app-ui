import 'package:flutter/material.dart';

import '../../utilities/app_fonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: const Color(0xfff9f9f9),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1.0,
            blurRadius: 2.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
            ),
            hintStyle: kTextFieldHint,
            hintText: 'Search',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
