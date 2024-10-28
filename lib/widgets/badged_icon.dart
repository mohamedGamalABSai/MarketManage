import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:vegan_admin_panel/consts/colors.dart';

class BadgedIcon extends StatelessWidget {
  const BadgedIcon({required this.icon, super.key});

  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -3, end: -1),
      showBadge: true,
      ignorePointer: false,
      badgeContent: const Text(
        '3',
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      badgeAnimation: const badges.BadgeAnimation.scale(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: AppColors.brownColor,
        padding: const EdgeInsets.all(5),
        borderRadius: BorderRadius.circular(4),
        elevation: 0,
      ),
      child: icon,
    );
  }
}
