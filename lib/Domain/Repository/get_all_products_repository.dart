import 'package:flutter_task_cycle_one/Domain/Models/product_response.dart';

abstract class GetAllProductsRepository {
  Future<List<ProductResponse>?> getAllProducts();
}
