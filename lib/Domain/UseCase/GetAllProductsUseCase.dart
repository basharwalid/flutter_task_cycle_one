import 'package:flutter_task_cycle_one/Data/Repository/GetAllProductsRepositoryImpl.dart';
import 'package:flutter_task_cycle_one/Domain/Models/ProductResponse.dart';
import 'package:flutter_task_cycle_one/Domain/Repository/GetAllProductsRepository.dart';
GetAllProductsUseCase injectGetAllProductsUseCase(){
  return GetAllProductsUseCase(repository: injectGetAllProductsRepository());
}
class GetAllProductsUseCase {
  GetAllProductsRepository repository;

  GetAllProductsUseCase({required this.repository});

  Future<List<ProductResponse>?> invoke() async{
    var response = await repository.getAllProducts();
    print("2");
    return response;
  }
}
