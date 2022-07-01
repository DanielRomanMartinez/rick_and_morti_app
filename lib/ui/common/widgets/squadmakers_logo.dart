import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquadMakersLogo extends StatelessWidget {
  const SquadMakersLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5.8, horizontal: 7.5), // Border width
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            border: Border.all(color: const Color(0xff12555F), width: 2),
          ),
          child: Image.asset(
            'assets/common/s_squadmakers_logo.png',
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(
          'assets/common/squadmakers_logo.svg', // Supposed to be white
          width: 125,
        ),
      ],
    );
  }
}
