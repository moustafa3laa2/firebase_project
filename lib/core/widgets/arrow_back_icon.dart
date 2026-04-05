
import 'package:flutter/material.dart';

class ArrowBackIcon extends StatelessWidget {
  const ArrowBackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41,
      height: 41,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE8ECF4)),
          borderRadius: BorderRadius.circular(12)),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
