import 'package:flutter/material.dart';

import 'package:vegan_admin_panel/provider/products_provider.dart';
import 'package:vegan_admin_panel/widgets/checklist_section.dart';

import 'package:vegan_admin_panel/widgets/text_field_widget.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({
    super.key,
    required this.provider,
  });

  final ProductsProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'General Description',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text('Product Name'),
        MyTextField(
            hint: 'Enter Product Name',
            textEditingController: provider.nameController,
            validate: (value) {
              return null;
            }),
        const Text('Sizes'),
        TextField(
          controller: provider.sizesController,
          readOnly: true,
          decoration: const InputDecoration(
            hintText: 'Selected sizes will appear here',
          ),
        ),
        SizeChecklist(
          textEditingController: provider.sizesController,
        ),
        // MyTextField(
        //     hint: 'Write Sizes',
        //     textEditingController:
        //         provider.sizesController,
        //     maxLines: 3,
        //     validate: (value) {
        //       return null;
        //     }),
      ],
    );
  }
}
