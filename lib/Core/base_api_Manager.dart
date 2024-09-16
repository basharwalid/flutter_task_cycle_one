import 'package:dio/dio.dart';
import 'package:flutter_task_cycle_one/Core/base_api_assets.dart';


abstract class BaseAPIManager <A extends BaseAPIAssets>{

  A apiAssets;
  BaseAPIManager(this.apiAssets);
  Dio dio = Dio();
}