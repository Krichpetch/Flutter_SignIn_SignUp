import 'package:flutter/material.dart';

import '../constants/constant.dart';

class myIconButton extends StatelessWidget {
  const myIconButton({
    super.key,
    required this.icon,
  });

  final icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: specialPrimary),
          borderRadius: BorderRadius.circular(16)),
          child: Image.asset(icon, height: 40,width: 40,),
    );

    
  }
}
