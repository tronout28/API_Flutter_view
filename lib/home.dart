import 'package:api_json/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
    final productController = Get.put(ProductController());
    ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: Obx(() => productController.isLoading.value
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (BuildContext context, int index) {
                final product = productController.productList[index];
                return Container(
                  margin: EdgeInsets.all(15),
                  child: ListTile(
                    leading: Image.network(product.imageLink),
                    title: Text(product.name),
                  ),
                );
              },
            )),
    );
  }
}