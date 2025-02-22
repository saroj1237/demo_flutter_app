import 'package:demo_flutter_app/features/products/domain/models/product.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(product.thumbnail),
    );
  }
}
