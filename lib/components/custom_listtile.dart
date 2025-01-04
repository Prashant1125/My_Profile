import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  const CustomListtile(
      {super.key, this.leading, this.title, this.subtitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (leading != null) leading!,
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) title!,
            if (subtitle != null) subtitle!,
          ],
        ),
        // const SizedBox(
        //   width: 10,
        // ),
        const Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}
