import 'package:exam_task/data/models/remote/product_response.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  ProductsSuccess({required this.response});

  final ProductResponse response;
}

final class ProductsFailure extends ProductsState {
  ProductsFailure({required this.errorMessage});

  final String errorMessage;
}

final class ProductsNetworkError extends ProductsState {
  ProductsNetworkError({required this.errorMessage});

  final String errorMessage;
}

final class ProductsNoData extends ProductsState {}