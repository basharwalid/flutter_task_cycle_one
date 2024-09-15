import 'package:dio/dio.dart';
import 'package:flutter_task_cycle_one/Core/BaseApiAssets.dart';


abstract class BaseAPIManager <A extends BaseAPIAssets>{

  A apiAssets;
  BaseAPIManager(this.apiAssets);
  Dio dio = Dio();
}