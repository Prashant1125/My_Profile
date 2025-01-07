import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_profile/utils/color_constants.dart';
import 'package:my_profile/utils/image_constants.dart';

class ElementTile extends StatelessWidget {
  final String? leadingIcon;
  final Color? color;
  final String? text;
  final void Function()? onTap;
  const ElementTile({
    super.key,
    this.leadingIcon,
    this.text,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          height: 28,
          width: 28,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(4)),
          child: leadingIcon != null
              ? SvgPicture.asset(
                  leadingIcon ?? '',
                )
              : Image.asset(
                  ImageConstants.userCheak,
                )),
      title: Text(text.toString(),
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorConstant.pureWhite)),
      trailing: SvgPicture.asset(ImageConstants.arrowRight),
      onTap: onTap,
    );
  }
}
