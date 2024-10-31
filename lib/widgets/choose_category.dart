import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/provider/menu.dart';
import 'package:vegan_admin_panel/provider/products_provider.dart';
import '../../controllers/MenuController.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({
    super.key,
    required this.notifier,
    required this.provider,
  });

  final AlertDialogNotifier notifier;
  final ProductsProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text('Products Category'),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton(
              isExpanded: true,
              borderRadius: BorderRadius.circular(15),
              elevation: 10,
              underline: Container(),
              value: notifier.dropValue,
              hint: const Text(
                'Choose Category',
                style: TextStyle(color: Colors.grey),
              ),
              items: const [
                DropdownMenuItem(value: 'T-Shirt', child: Text('T-Shirt')),
                DropdownMenuItem(value: 'Pullover', child: Text('Pullover')),
                DropdownMenuItem(
                    value: 'Sweatshirt', child: Text('Sweatshirt')),
                DropdownMenuItem(value: 'Blazer', child: Text('Blazer')),
              ],
              onChanged: (newValue) {
                notifier.changeDropMenu(newValue);
                provider.categoryName = newValue;
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
