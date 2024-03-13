import 'package:flutter/material.dart';


class MoreDetailsWidget extends StatelessWidget {
  const MoreDetailsWidget(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .02,
              fontWeight: FontWeight.w600,
              fontFamily: "Ciro",),
        ),
        Text(
          description,
          style:  TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Cairo",
                fontSize: MediaQuery.of(context).size.height*.018,
                letterSpacing: 0,
                color: const Color(0xff747688)),
        ),
      ],
    );
  }
}
