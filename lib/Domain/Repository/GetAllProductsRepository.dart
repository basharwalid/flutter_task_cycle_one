import 'package:flutter_task_cycle_one/Domain/Models/ProductResponse.dart';

abstract class GetAllProductsRepository{
  Future<List<ProductResponse>?> getAllProducts();
}