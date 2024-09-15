import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_task_cycle_one/Data/Api/FakeStoreApi.dart';
import 'package:flutter_task_cycle_one/Data/Models/ProductResponseDTO.dart';
import 'package:flutter_task_cycle_one/Domain/DataSource/AllProductsRemoteDataSource.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/DioExceptions.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/TimeOutOperationsException.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/UnknownException.dart';
import 'package:flutter_task_cycle_one/Domain/Models/ProductResponse.dart';

AllProductsRemoteDataSource injectAllProductsRemoteDataSource() {
  return AllProductsRemoteDataSourceImpl(
      apiManager: injectFakeStoreApiManager());
}

class AllProductsRemoteDataSourceImpl implements AllProductsRemoteDataSource {
  FakeStoreApiManager apiManager;

  AllProductsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<List<ProductResponse>?> getAllProducts()async{
      try{
          var response = await apiManager.getAllProducts().timeout(const Duration(seconds: 60));
          print("4");
          response!.map((e) => e.toDomain()).toList();
      }on DioException catch(e){
        throw DioServerException(errorMessage: e.type);
      }on TimeoutException {
        throw TimeOutOperationsException(errorMessage: "Loading Data Timed Out Refresh To Reload");
      }catch (e){
        throw UnknownException(errorMessage: e.toString());
      }
  }
}
