import 'package:flutter_task_cycle_one/Core/base_api_assets.dart';
FakeStoreApiAssets injectFakeStoreApiAssets(){
  return FakeStoreApiAssets.getInstance();
}


class FakeStoreApiAssets extends BaseAPIAssets{
  //singleton pattern
  FakeStoreApiAssets._();
  static FakeStoreApiAssets? _fakeStoreApiAssetsInstance;
  static FakeStoreApiAssets getInstance() {
    return _fakeStoreApiAssetsInstance ??= FakeStoreApiAssets._();
  }

  String baseUrl = "fakestoreapi.com";
  String productPath = "/products";
}
