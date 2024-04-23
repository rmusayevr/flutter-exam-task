import 'dart:developer';
import 'dart:io';

import 'package:exam_task/cubits/products/products_state.dart';
import 'package:exam_task/data/models/remote/product_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/remote/product_service.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  final ProductService _productService = ProductService();

  List<ProductResponse>? allProducts;
  final List<ProductResponse> deletedProducts = [];

  void getProductInfo() async {
    try {
      emit(ProductsLoading());
      allProducts = await _productService.getProducts();
      emit(ProductsSuccess(products: allProducts ?? []));
    } on SocketException catch (e) {
      log('SocketException: $e');
      emit(ProductsNetworkError(errorMessage: 'No Internet'));
    } catch (e) {
      log('catch: $e');
      emit(ProductsFailure(errorMessage: 'Error Occurred'));
    }
  }

  void removeProduct(int id) {
    allProducts!.removeWhere((product) {
      if (product.id == id) {
        deletedProducts.add(product);
        return true;
      }
      return false;
    });
    emit(ProductsSuccess(products: allProducts!));
  }
}
