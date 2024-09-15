import 'dart:convert';

import 'package:flutter_task_cycle_one/Core/BaseApiManager.dart';
import 'package:flutter_task_cycle_one/Data/Api/FakeStoreApiAssets.dart';
import 'package:flutter_task_cycle_one/Data/Models/ProductResponseDTO.dart';
import 'package:flutter_task_cycle_one/Domain/Models/ProductResponse.dart';
import 'package:http/http.dart' as http;

FakeStoreApiManager injectFakeStoreApiManager() {
  return FakeStoreApiManager.getInstance(injectFakeStoreApiAssets());
}

class FakeStoreApiManager extends BaseAPIManager<FakeStoreApiAssets> {

  //singleton pattern
  FakeStoreApiManager._(super.apiAssets);

  static FakeStoreApiManager? _fakeStoreApiManagerInstance;

  static FakeStoreApiManager getInstance(FakeStoreApiAssets apiAssets) {
    return _fakeStoreApiManagerInstance ??= FakeStoreApiManager._(apiAssets);
  }

  Future<List<ProductResponseDTO>?> getAllProducts() async {
    // get the url ready for calling
    var uri = Uri.https(apiAssets.baseUrl, "/products");
    //get response from the api
    var response = await dio.getUri<List<dynamic>>(uri);
    //return the response
    return response.data!.map((e) => ProductResponseDTO.fromJson(e)).toList();
  }
}
