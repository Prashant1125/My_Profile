import 'package:flutter/material.dart';
import 'package:my_profile/utils/image_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * (20 / 800),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * (22 / 360),
                      right: screenWidth * (20 / 360)),
                  child: InkWell(
                    child: Image.asset(ImageConstants.appbarBackButton),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenHeight * (25 / 800)),
                  child: const Text(
                    'Business Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * (25 / 800),
                      bottom: screenHeight * (25 / 800),
                      right: screenWidth * (20 / 360)),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color(0XFFF4F4F4)
                            .withAlpha((.3 * 255).round()),
                        borderRadius: BorderRadius.circular(20)),
                    child: InkWell(
                      child: Image.asset(ImageConstants.bellIcon),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * (25 / 800),
                      bottom: screenHeight * (25 / 800),
                      right: screenWidth * (25 / 360)),
                  child: InkWell(
                    child: Image.asset(ImageConstants.hamburgerThreeDots),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
