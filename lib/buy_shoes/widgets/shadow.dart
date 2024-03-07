import 'package:flutter/material.dart';

class MyShadow extends StatelessWidget {
  const MyShadow({super.key, required this.assetPath});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        color: Colors.black,
      ),
    );
  }
}

