import 'dart:io';

import 'package:exam_task/data/models/remote/product_response.dart';
import 'package:exam_task/utils/network/dio/dio_client.dart';

import '../../endpoints.dart';

class ProductService {
  Future<List<ProductResponse>> getProducts() async {
    try {
      const endpoint = Endpoints.productsUrl;
      final response = await productDio.get(endpoint);
      final List data = response.data;

      if (response.statusCode == 200) {
        return data.map((e) => ProductResponse.fromJson(e)).toList();
      }
      throw Exception();
    } on SocketException catch (e) {
      throw SocketException('$e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
