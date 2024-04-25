import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/products/products_cubit.dart';
import '../../../cubits/products/products_state.dart';
import '../../widgets/trash_icon_button.dart';
import '../home/widgets/products.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trash Page"),
        actions: const [TrashIconButton()],
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
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
            final products = cubit.deletedProducts;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];
                  return Products(
                    icon: Icons.replay_circle_filled_rounded,
                    product: product,
                    onPressed: () => context
                        .read<ProductsCubit>()
                        .recoveryProduct(product.id!, product),
                  );
                });
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
