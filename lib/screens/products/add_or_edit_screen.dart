import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:vegan_admin_panel/provider/products_provider.dart';
import 'package:vegan_admin_panel/widgets/text_field_widget.dart';

import '../../controllers/MenuController.dart';
import '../../models/products_model.dart';
import '../../widgets/app_bar.dart';

// ignore: must_be_immutable
class AddOrEditScreen extends StatelessWidget {
  AddOrEditScreen({super.key, this.isEdit = false, this.productModel});

  final TextEditingController productName = TextEditingController();
  final TextEditingController priceText = TextEditingController();
  final TextEditingController discountedPrice = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController discountPercentage = TextEditingController();
  final TextEditingController stock = TextEditingController();
  ProductModel? productModel;
  bool isEdit;

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<AlertDialogNotifier>(context);
    final provider = Provider.of<ProductsProvider>(context);

    productName.text = productModel!.name;
    priceText.text = productModel!.price.toStringAsFixed(2);
    discountedPrice.text = productModel!.price.toStringAsFixed(2);
    discountPercentage.text = productModel!.campaignDiscountedPrice.toString();
    stock.text = productModel!.stock.toString();
    description.text = productModel!.sizes.toString();
    notifier.imageUrl = notifier.imageUrl ?? productModel!.pictureName;
    notifier.radioValue =
        notifier.radioValue ?? productModel!.barcode.toString()!;
    notifier.dropValue = notifier.dropValue ?? productModel!.categoryName;
    String? uid = isEdit ? productModel?.barcode.toString() : const Uuid().v4();

    return Scaffold(
      appBar: myAppBar(context: context, title: 'Products', tabBarCheck: false),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    isEdit
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Edit Product',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Dashboard > Products > ${productModel?.name} > Edit Product',
                                style: const TextStyle(fontSize: 15),
                              )
                            ],
                          )
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add Product',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Dashboard > Products > Add Product',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size.fromHeight(40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: const BorderSide(color: Colors.red)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.green,
                              fixedSize: const Size.fromHeight(40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide.none),
                              side: BorderSide.none),
                          onPressed: () {
                            provider.addProduct();
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                !isEdit ? 'Add Product' : 'Save Changes',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ConditionalBuilder(
                condition: true,
                builder: (context) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'General Description',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text('Product Name'),
                                  MyTextField(
                                      hint: 'Enter Product Name',
                                      textEditingController: productName,
                                      validate: (value) {
                                        return null;
                                      }),
                                  const Text('Description'),
                                  MyTextField(
                                      hint: 'A Summarized Description',
                                      textEditingController: description,
                                      maxLines: 3,
                                      validate: (value) {
                                        return null;
                                      }),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Pricing',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Price'),
                                            MyTextField(
                                                hint: 'Enter Product Price',
                                                onChange: (value) {
                                                  notifier.calculatePercentage(
                                                      int.parse(priceText.text),
                                                      int.parse(value!));
                                                  discountPercentage.text =
                                                      '${notifier.discountPercentage.toStringAsFixed(0)}%';
                                                },
                                                textEditingController:
                                                    priceText,
                                                validate: (value) {
                                                  return null;
                                                }),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Stock'),
                                            MyTextField(
                                                hint: 'Enter how much in stock',
                                                textEditingController: stock,
                                                validate: (value) {
                                                  return null;
                                                }),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Discounted Price'),
                                            MyTextField(
                                                hint: 'Price After Discount',
                                                onChange: (value) {
                                                  notifier.calculatePercentage(
                                                      int.parse(priceText.text),
                                                      int.parse(value!));
                                                  discountPercentage.text =
                                                      '${notifier.discountPercentage.toStringAsFixed(0)}%';
                                                },
                                                textEditingController:
                                                    discountedPrice,
                                                validate: (value) {
                                                  return null;
                                                }),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                                'Discount Percentage (%)'),
                                            MyTextField(
                                                hint: 'Discount Percentage (%)',
                                                textEditingController:
                                                    discountPercentage,
                                                validate: (value) {
                                                  return null;
                                                }),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Product Media',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      notifier.pickedImage == null
                                          ? !isEdit
                                              ? Container(
                                                  width: 150,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.grey[200],
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          style: BorderStyle
                                                              .solid)),
                                                  child: Center(
                                                    child: IconButton(
                                                      icon: const Icon(Icons
                                                          .add_photo_alternate_outlined),
                                                      onPressed: () {
                                                        notifier.pickImage(
                                                            productModel
                                                                ?.barcode);
                                                      },
                                                    ),
                                                  ),
                                                )
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image(
                                                    image: NetworkImage(
                                                        '${productModel?.pictureName}'),
                                                    fit: BoxFit.fill,
                                                    width: 150,
                                                    height: 150,
                                                  ))
                                          : kIsWeb
                                              ? notifier.loadingUrl
                                                  ? Container(
                                                      child:
                                                          const SpinKitThreeBounce(
                                                        color: Colors.green,
                                                        size: 25,
                                                      ),
                                                    )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image(
                                                        image: MemoryImage(
                                                            notifier.webImage),
                                                        fit: BoxFit.fill,
                                                        width: 100,
                                                        height: 100,
                                                      ),
                                                    )
                                              : notifier.loadingUrl
                                                  ? const SpinKitThreeBounce(
                                                      color: Colors.green,
                                                      size: 25,
                                                    )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image(
                                                          image: FileImage(
                                                              notifier
                                                                  .pickedImage!),
                                                          fit: BoxFit.fill),
                                                    ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            fixedSize:
                                                const Size.fromHeight(40),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide.none),
                                            side: BorderSide.none),
                                        onPressed: () {
                                          notifier.pickImage(uid);
                                        },
                                        child: const Row(
                                          children: [
                                            Icon(
                                              IconlyBroken.upload,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Upload photo',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            fixedSize:
                                                const Size.fromHeight(40),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: BorderSide.none),
                                            side: BorderSide.none),
                                        onPressed: () {},
                                        child: const Row(
                                          children: [
                                            Icon(
                                              IconlyBroken.delete,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Clear Photo',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Category',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                                        DropdownMenuItem(
                                            value: 'Vegetables',
                                            child: Text('Vegetables')),
                                        DropdownMenuItem(
                                            value: 'Fruits',
                                            child: Text('Fruits')),
                                        DropdownMenuItem(
                                            value: 'Herbs',
                                            child: Text('Herbs')),
                                        DropdownMenuItem(
                                            value: 'Nuts', child: Text('Nuts')),
                                        DropdownMenuItem(
                                            value: 'Spices',
                                            child: Text('Spices'))
                                      ],
                                      onChanged: (newValue) {
                                        notifier.changeDropMenu(newValue);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text('Scale Option'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: DropdownButton(
                                      underline: Container(),
                                      isExpanded: true,
                                      value: notifier.radioValue,
                                      hint: const Text(
                                        'Choose Scale',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                            value: 'Piece',
                                            child: Text('Piece')),
                                        DropdownMenuItem(
                                            value: '1 Kg', child: Text('1 Kg')),
                                      ],
                                      onChanged: (newValue) {
                                        notifier.changeRadioValue(newValue);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                fallback: (context) => const Center(
                  child: SpinKitThreeBounce(
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
