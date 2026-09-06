import 'package:flutter/material.dart';

class GameBackground extends StatelessWidget {
  final Widget child;
 GameBackground({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/original-df5fd76539a41ab7808edcff5e2a5a4a.webp',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: 0.65),
          ),
        ),

        child,
      ],
    );
  }
} 