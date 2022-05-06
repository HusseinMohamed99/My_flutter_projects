// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, prefer_if_null_operators, prefer_const_constructors, file_names, duplicate_ignore, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_projects/Services/updateProduct.dart';
import 'package:flutter_projects/model/product_Model.dart';
import 'package:flutter_projects/shared/commpnents.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UpdateProductScreen extends StatefulWidget {
  static String id = 'update product';
  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String productName, desc, image;

  String price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context).settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Update Product',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                customTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                SizedBox(
                  height: 20,
                ),
                customTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'description',
                ),
                SizedBox(
                  height: 20,
                ),
                customTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'price',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                customTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'image',
                ),
                SizedBox(
                  height: 40,
                ),
                defaultButton(
                  radius: 50,
                  width: 200,
                  text: 'Update',
                  function: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);

                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName,
        price: price == null ? product.price.toString() : price,
        desc: desc == null ? product.description : desc,
        image: image == null ? product.image : image,
        category: product.category);
  }
}
