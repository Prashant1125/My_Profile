import 'package:flutter/material.dart';
import '../utils/image_constants.dart';

class ProfileIcon extends StatelessWidget {
  final String? imageUrl;
  const ProfileIcon({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: const Color(0XFF55A6C4),
                ),
                borderRadius: BorderRadius.circular(999)),
            child: imageUrl != null
                ? Image.network(
                    imageUrl ?? '',
                  )
                : Image.asset(
                    ImageConstants.avatar,
                  )),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
