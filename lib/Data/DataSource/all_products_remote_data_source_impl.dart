import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_task_cycle_one/Data/Api/fake_store_api.dart';
import 'package:flutter_task_cycle_one/Data/Models/product_response_dto.dart';
import 'package:flutter_task_cycle_one/Domain/DataSource/all_products_remote_dataSource.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/dio_exceptions.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/timeout_operations_exception.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/unknown_exception.dart';
import 'package:flutter_task_cycle_one/Domain/Models/product_response.dart';

AllProductsRemoteDataSource injectAllProductsRemoteDataSource() {
  return AllProductsRemoteDataSourceImpl(
      apiManager: injectFakeStoreApiManager());
}

class AllProductsRemoteDataSourceImpl implements AllProductsRemoteDataSource {
  FakeStoreApiManager apiManager;

  AllProductsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<List<ProductResponse>?> getAllProducts() async{
    try{
      var response = await apiManager.getAllProducts().timeout(const Duration(seconds: 60));
      return response!.map((e) => e.toDomain()).toList();
    }on DioException catch(e){
      throw DioServerException(errorMessage: e.type);
    }on TimeoutException {
      throw TimeOutOperationsException(errorMessage: "Loading Data Timed Out Refresh To Reload");
    }catch (e){
      throw UnknownException(errorMessage: e.toString());
    }
  }


}
