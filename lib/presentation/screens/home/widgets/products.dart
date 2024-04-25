import 'package:exam_task/data/models/remote/product_response.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.product,
    this.onPressed,
    required this.icon,
  });

  final ProductResponse product;
  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: Image.network(product.image!),
          ),
          Text(
            product.title!,
            maxLines: 2,
          ),
          Text(product.price.toString()),
        ],
      ),
    );
  }
}
