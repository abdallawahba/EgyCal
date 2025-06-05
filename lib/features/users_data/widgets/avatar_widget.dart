import 'package:egycal/core/constants.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String? image;
  final VoidCallback onTap;
  final bool isSelected;

  const AvatarWidget({
    super.key,
    this.image,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: kSecondaryColor, width: 2.0)
              : null,
        ),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: image != null ? AssetImage(image!) : null,
          child: image == null ? const Icon(Icons.person, size: 50) : null,
        ),
      ),
    );
  }
}