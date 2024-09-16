import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_task_cycle_one/Core/base_api_Manager.dart';
import 'package:flutter_task_cycle_one/Data/Api/fake_store_api_assets.dart';
import 'package:flutter_task_cycle_one/Data/Models/product_response_dto.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/Api_exception.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/dio_exceptions.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/timeout_operations_exception.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/unknown_exception.dart';
import 'package:http/http.dart' as http;

//method used for dependency injection
FakeStoreApiManager injectFakeStoreApiManager() {
  return FakeStoreApiManager.getInstance(injectFakeStoreApiAssets());
}

class FakeStoreApiManager extends BaseAPIManager<FakeStoreApiAssets> {
  // singleton pattern
  FakeStoreApiManager._(super.apiAssets);

  static FakeStoreApiManager? _fakeStoreApiManagerInstance;

  static FakeStoreApiManager getInstance(FakeStoreApiAssets apiAssets) {
    return _fakeStoreApiManagerInstance ??= FakeStoreApiManager._(apiAssets);
  }

  //method to get data from the api and convert it
  Future<List<ProductResponseDTO>?> getAllProducts() async {
    try {
      var uri = Uri.https(apiAssets.baseUrl, apiAssets.productPath);
      var response = await dio.get(uri.toString());
      if (response.data == null) {
        throw ApiException(errorMessage: "API response is null");
      }
      List<dynamic> jsonList = response.data as List<dynamic>;
      return jsonList.map((e) => ProductResponseDTO.fromJson(e)).toList();
    } on DioException catch (e) {
      throw DioServerException(errorMessage: e.type);
    } on TimeoutException catch (e) {
      throw TimeOutOperationsException(
          errorMessage: "Loading Data Timed Out Refresh To Reload");
    } catch (e) {
      throw UnknownException(errorMessage: e.toString());
    }
  }
}
