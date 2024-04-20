import 'dart:developer';
import 'dart:io';

import 'package:exam_task/cubits/products/products_state.dart';
import 'package:exam_task/data/models/remote/product_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/remote/product_service.dart';


class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  ProductResponse? result;

  void getProductInfo() async {
    try {
      emit(ProductsLoading());
      result = await ProductService.getProducts();
      emit(ProductsSuccess(response: result!));
    } on SocketException catch (e) {
      log('SocketException: $e');
      emit(ProductsNetworkError(errorMessage: 'No Internet'));
    } catch (e) {
      log('catch: $e');
      emit(ProductsFailure(errorMessage: 'Error Occurred'));
    }
  }
}