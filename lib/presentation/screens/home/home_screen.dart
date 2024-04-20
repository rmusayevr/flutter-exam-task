import 'dart:math';

import 'package:exam_task/cubits/products/products_cubit.dart';
import 'package:exam_task/cubits/products/products_state.dart';
import 'package:exam_task/presentation/screens/home/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsCubit productCubit = context.read<ProductsCubit>();
    print(productCubit);
    return GridView.builder(
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) =>
          BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsInitial || state is ProductsLoading) {
            return const CircularProgressIndicator();
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
            return Products(product: state.response);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
