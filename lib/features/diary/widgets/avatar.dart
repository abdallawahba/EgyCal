import 'package:flutter/material.dart';

class avatarImage extends StatelessWidget {
  final String? image;
  const avatarImage({super.key , this.image});

  @override
  Widget build(BuildContext context) {
    bool isAssetImage = image?.startsWith('assets/') ?? false;
    return InkWell(
      onTap: (){
      },
      child: CircleAvatar(
        radius: 25,
        backgroundImage: isAssetImage ? AssetImage(image!) : NetworkImage(image!),
      ),
    );
  }
}