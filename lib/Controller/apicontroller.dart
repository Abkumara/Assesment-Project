import 'dart:convert';

import 'package:assesmnet_project/Model/productmodel.dart';
import 'package:http/http.dart' as http;

class ApiController {
  static const _database = 'https://dummyjson.com/products';
  Future<List<ProductModel>> getData() async {
    final respone = await http.get(Uri.parse(_database));
    if (respone.statusCode == 200) {
      final passData = json.decode(respone.body)["products"] as List;
      print(passData);
      return passData.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('error');
    }
  }
}
