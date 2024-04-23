import 'package:exam_task/cubits/products/products_cubit.dart';
import 'package:exam_task/cubits/products/products_state.dart';
import 'package:exam_task/presentation/screens/home/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (_, state) {
        if (state is ProductsInitial || state is ProductsLoading) {
          return const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductsNetworkError) {
          return Text(
            state.errorMessage,
            style: const TextStyle(fontSize: 32),
          );
        } else if (state is ProductsFailure) {
          return Text(
            state.errorMessage,
            style: const TextStyle(fontSize: 32),
          );
        } else if (state is ProductsSuccess) {
          final products = state.products;
          return GridView.builder(
              itemCount: context.read<ProductsCubit>().allProducts!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (_, index) {
                final product = products[index];
                return Products(
                  product: product,
                  onPressed: () =>
                      context.read<ProductsCubit>().removeProduct(product.id!),
                );
              });
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
