import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MainLine extends StatelessWidget {
  const MainLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
            top: 20,
            left: 260,
            child: SvgPicture.asset("assets/Images/mainline.svg"));
  }
}