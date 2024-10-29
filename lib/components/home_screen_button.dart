import 'package:flutter/material.dart';

import '../constants/constant.dart';

import '../screens/blank_screen.dart';

class HomeScreenButtonSmall extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bgColor;
  final Color iconColor;
  final TextStyle textStyle;

  const HomeScreenButtonSmall({
    super.key,
    required this.icon,
    required this.label,
    required this.bgColor,
    required this.iconColor,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: 140,
        height: 130,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BlankScreen()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Icon(icon, color: iconColor, size: 50)),
              const SizedBox(height: 8),
              Text(
                label,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenButtonBig extends StatelessWidget {
  final String label;
  final String backgroundImage;

  const HomeScreenButtonBig({
    super.key,
    required this.label,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: 215,
        height: 130,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: themeSecondary,
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BlankScreen()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textTitleSecondary,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
