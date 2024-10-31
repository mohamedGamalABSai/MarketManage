import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vegan_admin_panel/provider/products_provider.dart';
import '../../controllers/MenuController.dart';
import '../../models/products_model.dart';

class ProductMedia extends StatelessWidget {
  const ProductMedia({
    super.key,
    required this.notifier,
    required this.isEdit,
    required this.productModel,
    required this.uid,
    required this.provider,
  });

  final AlertDialogNotifier notifier;
  final bool isEdit;
  final ProductModel? productModel;
  final String? uid;
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
            'Product Media',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              notifier.pickedImage == null
                  ? !isEdit
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200],
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid)),
                          child: Center(
                            child: IconButton(
                              icon: const Icon(
                                  Icons.add_photo_alternate_outlined),
                              onPressed: () {
                                notifier.pickImage(productModel?.barcode);
                              },
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: NetworkImage('${productModel?.pictureName}'),
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 300,
                          ))
                  : kIsWeb
                      ? notifier.loadingUrl
                          ? const SpinKitThreeBounce(
                              color: Colors.green,
                              size: 25,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: MemoryImage(notifier.webImage),
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: 300,
                              ),
                            )
                      : notifier.loadingUrl
                          ? const SpinKitThreeBounce(
                              color: Colors.green,
                              size: 25,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  image: FileImage(notifier.pickedImage!),
                                  fit: BoxFit.fill),
                            ),
            ],
          ),
          const SizedBox(
            height: 40,
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
              notifier.pickImage(uid);
              String imagePath = notifier.imageUrl!;
              provider.pictureName = imagePath;
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
