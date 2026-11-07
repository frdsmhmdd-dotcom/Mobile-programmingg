import 'package:flutter/material.dart';

class MenuImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;

  const MenuImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          color: Colors.orange.shade50,
          child: const Center(
            child: Icon(
              Icons.restaurant,
              color: Colors.deepOrange,
              size: 36,
            ),
          ),
        );
      },
    );
  }
}
