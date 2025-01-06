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
      leading: Container(
          height: 22,
          width: 24,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(4)),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
              child: leadingIcon != null
                  ? SvgPicture.asset(
                      leadingIcon ?? '',
                    )
                  : Image.asset(
                      ImageConstants.userCheak,
                    ))),
      title: Text(
        text.toString(),
        style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: ColorConstant.pureWhite),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: ColorConstant.pureWhite,
      ),
      onTap: onTap,
    );
  }
}
