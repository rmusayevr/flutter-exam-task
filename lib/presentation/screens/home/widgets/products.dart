import 'package:exam_task/data/models/remote/product_response.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.product,
    this.onPressed,
  });

  final ProductResponse product;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            product.image!,
            fit: BoxFit.fill,
            height: 75,
          ),
          Text(
            product.title!,
            style: const TextStyle(fontSize: 10),
          ),
          Text(product.price!.toStringAsPrecision(3)),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.remove_circle_outline_rounded),
          )
        ],
      ),
    );
  }
}
