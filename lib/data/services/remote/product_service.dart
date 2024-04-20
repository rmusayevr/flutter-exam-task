import 'dart:convert';
import 'dart:io';

import 'package:exam_task/data/models/remote/product_response.dart';
import 'package:exam_task/utils/network/dio/dio_client.dart';

import '../../endpoints.dart';

class ProductService {
  static Future<ProductResponse> getProducts() async {
    try {
      const endpoint = Endpoints.productsUrl;
      final response = await productDio.get(endpoint);
      List<dynamic> dataList = json.decode(response.data);

      Map<String, dynamic> resultMap = {};
      dataList.forEach((item) {
        if (item is Map<String, dynamic>) {
          resultMap.addAll(Map<String, dynamic>.from(item));
        }
      });
      if (response.statusCode == 200) {
        return ProductResponse.fromJson(resultMap);
      }
      throw Exception();
    } on SocketException catch (e) {
      throw SocketException('$e');
    } catch (e) {
      throw Exception(e);
    }
  }
}
