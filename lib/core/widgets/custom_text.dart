import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const CustomText({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$text1 ",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ).copyWith(color: Color(0xffBFA054)),
          ),
        ),
      ],
    );
  }
}
