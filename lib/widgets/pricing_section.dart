import 'package:flutter/material.dart';
import 'package:vegan_admin_panel/provider/products_provider.dart';
import 'package:vegan_admin_panel/widgets/text_field_widget.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({
    super.key,
    required this.provider,
  });

  final ProductsProvider provider;

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    const paddingBetweenRows = SizedBox(height: 15);

    Widget buildInputField({
      required String label,
      required String hint,
      required TextEditingController controller,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: labelStyle),
          MyTextField(
            hint: hint,
            textEditingController: controller,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pricing',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          paddingBetweenRows,
          Row(
            children: [
              Flexible(
                flex: 1,
                child: buildInputField(
                  label: 'Price',
                  hint: 'Enter Product Price',
                  controller: provider.priceController,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                flex: 1,
                child: buildInputField(
                  label: 'Stock',
                  hint: 'Enter how much in stock',
                  controller: provider.stockController,
                ),
              ),
            ],
          ),
          paddingBetweenRows,
          Row(
            children: [
              Flexible(
                flex: 1,
                child: buildInputField(
                  label: 'Discounted Price',
                  hint: 'Price After Discount',
                  controller: provider.discountedPriceController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
