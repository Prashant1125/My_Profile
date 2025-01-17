import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String fieldTitle;
  final String title2;
  final Widget? description;
  const Label(
      {super.key,
      required this.fieldTitle,
      required this.title2,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: fieldTitle.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Colors.white,
            ),
            children: <TextSpan>[
              TextSpan(
                text: title2.toString(),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        if (description != null) description!,
      ],
    );
  }
}
