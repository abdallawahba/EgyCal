import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/models/users_data_model.dart';
import 'avatar_widget.dart';

class AvatarsMatrix extends StatefulWidget {
  const AvatarsMatrix({super.key});

  @override
  State<AvatarsMatrix> createState() => _AvatarsMatrixState();
}

class _AvatarsMatrixState extends State<AvatarsMatrix> {
  String? _selectedAvatarImagePath;
  Widget _buildAvatar(BuildContext context, String imagePath) {
    return AvatarWidget(
      image: imagePath,
      isSelected: _selectedAvatarImagePath == imagePath,
      onTap: () {
        setState(() {
          _selectedAvatarImagePath = imagePath;
        });
        Provider.of<UserDataModel>(context, listen: false)
            .saveAvatar(imagePath);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const String basePath = 'assets/images/';
    final List<String> avatarImagePaths = [
      '${basePath}Ellipse 8.png',
      '${basePath}Ellipse 9.png',
      '${basePath}Ellipse 10.png',
      '${basePath}Ellipse 11.png',
      '${basePath}Ellipse 12.png',
      '${basePath}Ellipse 13.png',
      '${basePath}Ellipse 14.png',
      '${basePath}Ellipse 15.png',
      '${basePath}Ellipse 16.png',
    ];
    return Padding(
      padding: EdgeInsets.only(top: 30.r),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.r),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.r),
                  child: _buildAvatar(context, avatarImagePaths[0]),
                ),
                _buildAvatar(context, avatarImagePaths[1]),
                Padding(
                  padding: EdgeInsets.only(left: 8.r),
                  child: _buildAvatar(context, avatarImagePaths[2]),
                ),
              ],
            ),
          ),
          // Second Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAvatar(context, avatarImagePaths[3]),
              _buildAvatar(context, avatarImagePaths[4]),
              _buildAvatar(context, avatarImagePaths[5]),
            ],
          ),
          // Third Row
          Padding(
            padding: EdgeInsets.only(top: 8.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAvatar(context, avatarImagePaths[6]),
                _buildAvatar(context, avatarImagePaths[7]),
                _buildAvatar(context, avatarImagePaths[8]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
