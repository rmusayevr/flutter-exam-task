import 'package:exam_task/cubits/products/products_cubit.dart';
import 'package:exam_task/cubits/products/products_state.dart';
import 'package:exam_task/presentation/screens/trash/trash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrashIconButton extends StatelessWidget {
  const TrashIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: cubit,
              child: const TrashScreen(),
            ),
          ),
        );
      },
      child: Stack(
        children: [
          const Icon(
            Icons.delete_outline_rounded,
            size: 32,
          ),
          Positioned(
            right: 4,
            bottom: 12,
            child: ColoredBox(
              color: Colors.red,
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  return Text(
                    state is ProductsSuccess
                        ? context
                            .read<ProductsCubit>()
                            .deletedProducts
                            .length
                            .toString()
                        : "",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
