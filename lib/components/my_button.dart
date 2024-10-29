import 'package:flutter/material.dart';

import '../constants/constant.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
    this.hintText,
  });

  final Function()? onTap;
  final hintText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        margin:
          const EdgeInsetsDirectional.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: highlightPrimary,
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Center(child: Text(hintText, style: textButtonSecondary,)),
      ),
    );
  }
}
