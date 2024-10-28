//
//
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:vegan_admin_panel/provider/products_provider.dart';
// import 'package:vegan_admin_panel/widgets/text_field_widget.dart';
//
// import '../controllers/MenuController.dart';
// import '../models/products_model.dart';
//
// void showAddOrEditProduct ({
//   required BuildContext context,
//   required ProductModel? productModel,
//   required ProductsProvider provider,
//   required TextEditingController productName,
//   required TextEditingController price,
//   required TextEditingController discountedPrice,
//   required TextEditingController description,
//
// }){
//   final notifier = Provider.of<AlertDialogNotifier>(context);
//   notifier.checkBoxValue = productModel!.isOnSale;
//   notifier.dropValue = productModel.productCategoryName;
//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           surfaceTintColor: Colors.white,
//           title: const Text('Add Product'),
//           content: SizedBox(
//             width: 800,
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     notifier.pickedImage == null ?
//                     ClipRRect(
//                         borderRadius: BorderRadius.circular(
//                             15),
//                         child: Image(image: NetworkImage(
//                             '${productModel.imageUrl}'),
//                           fit: BoxFit.fill,
//                           width: 150,
//                           height: 150,)) :
//                     kIsWeb ?
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(
//                           15),
//                       child: Image(
//                         image: MemoryImage(notifier.webImage),
//                         fit: BoxFit.fill,
//                         width: 100,
//                         height: 100,),
//                     )
//                         :
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(
//                           15),
//                       child: Image(
//                           image: FileImage(notifier.pickedImage!),
//                           fit: BoxFit.fill),
//                     ),
//                     Column(
//                       children: [
//                         OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               fixedSize: const Size(
//                                   165, 40),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius
//                                       .circular(10),
//                                   side: BorderSide.none
//                               ),
//                               side: BorderSide.none
//                           ),
//                           onPressed: () {
//                             notifier.pickImage(productModel.id);
//                           },
//                           child: const Row(
//                             children: [
//                               Icon(IconlyBroken.upload,
//                                 color: Colors.white,),
//                               SizedBox(width: 5,),
//                               Text('Upload photo',
//                                 style: TextStyle(
//                                     color: Colors.white),),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 30,),
//                         OutlinedButton(
//                           style: OutlinedButton.styleFrom(
//                               backgroundColor: Colors.red,
//                               fixedSize: const Size(
//                                   165, 40),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius
//                                       .circular(10),
//                                   side: BorderSide.none
//                               ),
//                               side: BorderSide.none
//                           ),
//                           onPressed: () {},
//                           child: const Row(
//                             children: [
//                               Icon(IconlyBroken.delete,
//                                 color: Colors.white,),
//                               SizedBox(width: 5,),
//                               Text('Clear Photo',
//                                 style: TextStyle(
//                                     color: Colors.white),),
//                             ],
//                           ),
//                         ),
//
//                       ],
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   child: ListView(
//                       children: [
//                         MyTextField(
//                           hint: 'Product Name',
//                           textEditingController: productName,
//                           validate: (value) {
//                             return null;
//                           },
//                         ),
//                         MyTextField(
//                           hint: 'Price',
//                           textEditingController: price,
//                           validate: (value) {
//                             return null;
//                           },
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10.0),
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 value: notifier.checkBoxValue,
//                                 onChanged: (newValue) {
//                                   notifier.changeCheckBoxValue(newValue);
//                                 },
//                               ),
//                               const Text('Discount'),
//                               Spacer(),
//                               Radio(
//                                   value: 'Piece',
//                                   groupValue: notifier.radioValue,
//                                   onChanged: (newValue) {
//                                     notifier.changeRadioValue(newValue);
//                                   }
//                               ),
//                               const Text('Piece'),
//                               SizedBox(width: 30,),
//                               Radio(
//                                   value: '1 Kg',
//                                   groupValue: notifier.radioValue,
//                                   onChanged: (newValue) {
//                                     notifier.changeRadioValue(newValue);
//                                   }
//                               ),
//                               const Text('Kg'),
//
//                             ],
//                           ),
//                         ),
//                         Visibility(
//                           visible: notifier.checkBoxValue,
//                           child: MyTextField(
//                             hint: 'After Discount',
//                             textEditingController: discountedPrice,
//                             validate: (value) {
//                               return null;
//                             },
//                           ),
//                         ),
//                         DropdownButton(
//                           isExpanded: true,
//                           value: notifier.dropValue,
//                           hint: const Text('Choose Category',
//                             style: TextStyle(color: Colors.grey),),
//                           items: const [
//                             DropdownMenuItem(
//                                 value: 'Vegetables',
//                                 child: Text('Vegetables')
//                             ),
//                             DropdownMenuItem(
//                                 value: 'Fruits',
//                                 child: Text('Fruits')
//                             ),
//                             DropdownMenuItem(
//                                 value: 'Herbs',
//                                 child: Text('Herbs')
//                             ),
//                             DropdownMenuItem(
//                                 value: 'Nuts',
//                                 child: Text('Nuts')
//                             ),
//                             DropdownMenuItem(
//                                 value: 'Spices',
//                                 child: Text('Spices')
//                             )
//                           ],
//                           onChanged: (newValue) {
//                             notifier.changeDropMenu(newValue);
//                           },),
//                         MyTextField(
//                           maxLines: 2,
//                           hint: 'Description',
//                           textEditingController: description,
//                           validate: (value) {
//                             return null;
//                           },
//                         ),
//                       ]
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           fixedSize: const Size(130, 40),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius
//                                   .circular(10),
//                               side: BorderSide.none
//                           ),
//                           side: BorderSide.none
//                       ),
//                       onPressed: () {},
//                       child: const Row(
//                         children: [
//                           Icon(Icons.cancel_outlined,
//                             color: Colors.white,),
//                           SizedBox(width: 5,),
//                           Text('Cancel', style: TextStyle(
//                               color: Colors.white),),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 25,),
//                     OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           fixedSize: const Size(156, 40),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius
//                                   .circular(10),
//                               side: BorderSide.none
//                           ),
//                           side: BorderSide.none
//                       ),
//                       onPressed: () {
//                         provider.editProduct(
//                             id: productModel.id,
//                             title: productName.text,
//                             imageUrl: notifier.imageUrl ??
//                                 productModel.imageUrl,
//                             price: double.parse(price.text),
//                             salePrice: discountedPrice.text.isEmpty
//                                 ? 0.0
//                                 : double.parse(discountedPrice.text),
//                             isOnSale: notifier.checkBoxValue,
//                             productCategoryName: notifier.dropValue,
//                             scale: notifier.radioValue
//                         ).then((onValue) {});
//                       },
//                       child: const Row(
//                         children: [
//                           Icon(Icons.check,
//                             color: Colors.white,),
//                           SizedBox(width: 5,),
//                           Text('Add Product',
//                             style: TextStyle(
//                                 color: Colors.white),),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       });
// }
