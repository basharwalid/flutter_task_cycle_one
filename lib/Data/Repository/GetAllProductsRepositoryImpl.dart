import 'package:flutter_task_cycle_one/Data/DataSource/AllProductsRemoteDataSourceImpl.dart';
import 'package:flutter_task_cycle_one/Data/Models/ProductResponseDTO.dart';
import 'package:flutter_task_cycle_one/Domain/DataSource/AllProductsRemoteDataSource.dart';
import 'package:flutter_task_cycle_one/Domain/Models/ProductResponse.dart';
import 'package:flutter_task_cycle_one/Domain/Repository/GetAllProductsRepository.dart';

GetAllProductsRepository injectGetAllProductsRepository() {
  return GetAllProductsRepositoryImpl(
      remoteDataSource: injectAllProductsRemoteDataSource());
}

class GetAllProductsRepositoryImpl implements GetAllProductsRepository {
  AllProductsRemoteDataSource remoteDataSource;

  GetAllProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductResponse>?> getAllProducts() async {
    var response = await remoteDataSource.getAllProducts();
    return response;
  }
}
