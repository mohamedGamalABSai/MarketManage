import 'package:flutter/material.dart';

class WarningDialog {
  Future<void> showWarningDialog({required context, required themeData, required msg, required title}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.only(right: 20, left:20, top: 12),
              title: Row(
                children: [
                  const Image(image: AssetImage('assets/random/warning-sign.png'),height: 25,width: 25,fit: BoxFit.cover,),
                  const SizedBox(width: 5,),
                  Text(title, style: themeData.textTheme.bodyMedium),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text('No')
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Yes')
                )
              ],
              content: Text('Are You Sure?',style: themeData.textTheme.bodyMedium,)
          );
        }
    );
  }
}