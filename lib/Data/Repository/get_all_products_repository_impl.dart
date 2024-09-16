import 'package:flutter_task_cycle_one/Data/DataSource/all_products_remote_data_source_impl.dart';
import 'package:flutter_task_cycle_one/Data/Models/product_response_dto.dart';
import 'package:flutter_task_cycle_one/Domain/DataSource/all_products_remote_dataSource.dart';
import 'package:flutter_task_cycle_one/Domain/Models/product_response.dart';
import 'package:flutter_task_cycle_one/Domain/Repository/get_all_products_repository.dart';

GetAllProductsRepository injectGetAllProductsRepository() {
  return GetAllProductsRepositoryImpl(
      remoteDataSource: injectAllProductsRemoteDataSource());
}

class GetAllProductsRepositoryImpl implements GetAllProductsRepository {
  AllProductsRemoteDataSource remoteDataSource;

  GetAllProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductResponse>?> getAllProducts() async{
    var response = await remoteDataSource.getAllProducts();
    return response;
  }


}
