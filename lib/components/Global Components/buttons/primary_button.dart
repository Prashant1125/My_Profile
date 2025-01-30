import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonText,
    //required this.uniqueButtonId,
    required this.onTap,
    required this.isEnabled,
    required this.backgroundColor,
    required this.textColor,
    required this.hasIcon,
    this.iconPath,
  });

  final double buttonHeight;
  final double? buttonWidth;
  final String buttonText;

  //final String uniqueButtonId;
  final VoidCallback onTap;
  final bool isEnabled;
  final Color backgroundColor;
  final Color textColor;
  final String? iconPath;
  final bool hasIcon;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Container(
            width: widget.buttonWidth,
            height: widget.buttonHeight,
            decoration: BoxDecoration(
                color: widget.isEnabled
                    ? widget.backgroundColor
                    : widget.backgroundColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: widget.backgroundColor,
                    width: widget.isEnabled ? 0 : 1)),
            child: Center(
              child: widget.hasIcon
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: SvgPicture.asset(widget.iconPath ??
                              'assets/images/message_icon.svg'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.buttonText,
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    )
                  : Text(
                      widget.buttonText,
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
            )));
  }
}
