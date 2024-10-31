import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/consts/colors.dart';

class SizeChecklist extends StatefulWidget {
  final TextEditingController textEditingController;

  const SizeChecklist({
    super.key,
    required this.textEditingController,
  });

  @override
  _SizeChecklistState createState() => _SizeChecklistState();
}

class _SizeChecklistState extends State<SizeChecklist> {
  final List<String> availableSizes = ["s", "m", "l", "xl", "xxl"];
  List<String> selectedSizes = [];

  void updateSizes() {
    // Join selected sizes into a single string and update the controller
    widget.textEditingController.text = selectedSizes.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: availableSizes.map((size) {
        return CheckboxListTile(
          selectedTileColor: AppColors.brownColor,
          title: Text(size.toUpperCase()),
          value: selectedSizes.contains(size),
          onChanged: (bool? isChecked) {
            setState(() {
              if (isChecked ?? false) {
                selectedSizes.add(size);
              } else {
                selectedSizes.remove(size);
              }
              updateSizes(); // Update the controller with selected sizes
            });
          },
        );
      }).toList(),
    );
  }
}
