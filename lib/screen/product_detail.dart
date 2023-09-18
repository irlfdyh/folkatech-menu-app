import 'package:flutter/material.dart';
import 'package:folkatech_product_app/entity/product_entity.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Detail Product"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                const Center(child: CircularProgressIndicator()),
                Center(
                  child: FadeInImage.memoryNetwork(
                    width: 400,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                    image: product.cover,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(product.price.toString(),
                      style: Theme.of(context).textTheme.titleLarge)
                ],
              ),
            ),
            const Divider(color: Colors.grey, height: 2, thickness: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description",
                      style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
