import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool isPrimary;
  final void Function()? onTap;
  final Color? color;

  const AppButton({
    super.key,
    required this.title,
    this.isPrimary = true,
    this.onTap,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 19),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isPrimary ? Color(0xffBFA054) : color,
          border: Border.all(
            color: isPrimary ? Color(0xffBFA054) : Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400).copyWith(
            color: isPrimary || color == Colors.black
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
