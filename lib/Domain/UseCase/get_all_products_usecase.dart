import 'package:flutter_task_cycle_one/Data/Repository/get_all_products_repository_impl.dart';
import 'package:flutter_task_cycle_one/Domain/Models/product_response.dart';
import 'package:flutter_task_cycle_one/Domain/Repository/get_all_products_repository.dart';
GetAllProductsUseCase injectGetAllProductsUseCase(){
  return GetAllProductsUseCase(repository: injectGetAllProductsRepository());
}
class GetAllProductsUseCase {
  GetAllProductsRepository repository;

  GetAllProductsUseCase({required this.repository});

  Future<List<ProductResponse>?> invoke() async{
    var response = await repository.getAllProducts();
    return response;
  }
}
