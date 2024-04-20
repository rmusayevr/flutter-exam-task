import 'package:exam_task/data/models/remote/product_response.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.product,
  });

  final ProductResponse product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.image!),
          Text(product.title!),
          Text(product.price!.toStringAsPrecision(2)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_circle_outline_rounded),
          )
        ],
      ),
    );
  }
}
