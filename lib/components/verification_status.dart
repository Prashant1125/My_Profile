import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_profile/controllers/verification_controller.dart';

class VerificationStatus extends StatelessWidget {
  final int status;
  const VerificationStatus({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    var verificationController = VerificationController();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: verificationController.getColor(status),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            SvgPicture.asset(verificationController.getIcon(status)),
            const SizedBox(
              width: 2,
            ),
            Text(
              verificationController.getStatus(status),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
