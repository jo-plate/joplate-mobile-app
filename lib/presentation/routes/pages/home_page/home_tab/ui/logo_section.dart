import 'package:joplate/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/images/logo.png", width: 100, height: 100),
    );
  }
}
