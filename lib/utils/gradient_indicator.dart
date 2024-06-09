
import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  const GradientCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.center,
          radius: 0.5,
          colors: <Color>[Colors.red, Colors.yellow],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}