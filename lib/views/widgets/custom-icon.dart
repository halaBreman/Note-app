import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon, this.onPressed}) : super(key: key);
  final IconData icon;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.01),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 28,
          ),
        )
      ),
    );
  }
}
