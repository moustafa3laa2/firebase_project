import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInWithCard extends StatelessWidget {
  final String title;
  final String image;
  final void Function()? onTap;
  const SignInWithCard({super.key, required this.title, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffE8ECF4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 9),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ).copyWith(color: Color(0xff6A707C)),
            ),
          ],
        ),
      ),
    );
  }
}
