import 'package:flutter_task_cycle_one/Data/Models/product_response_dto.dart';
import 'package:flutter_task_cycle_one/Domain/Models/product_response.dart';

abstract class AllProductsRemoteDataSource{
  Future<List<ProductResponse>?> getAllProducts();
}