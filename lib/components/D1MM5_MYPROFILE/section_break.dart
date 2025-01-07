import 'package:flutter/material.dart';
import '../../utils/color_constants.dart';

class SectionBreak extends StatelessWidget {
  final String sectionTitle;
  final Widget? sectionDescription;

  const SectionBreak({
    super.key,
    required this.sectionTitle,
    this.sectionDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(sectionTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorConstant.offWhite)),
          const SizedBox(
            height: 3,
          ),
          const Divider(
            height: .2,
            thickness: .5,
          ),
          if (sectionDescription != null) sectionDescription!,
        ],
      ),
    );
  }
}
