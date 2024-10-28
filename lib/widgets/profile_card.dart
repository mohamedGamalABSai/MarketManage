import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {required this.title,
      this.subTitle,
      required this.leading,
      required this.onTap,
      super.key});

  final String title;
  final String? subTitle;
  final IconData leading;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(leading),
              const SizedBox(
                width: 15,
              ),
              Text(title, style: const TextTheme().bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
