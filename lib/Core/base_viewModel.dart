import 'package:flutter/material.dart';
import 'package:flutter_task_cycle_one/Core/base_navigator.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/dio_exceptions.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/internet_connection_exception.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/timeout_operations_exception.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/url_launcher_exception.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {
  N? navigator;

  String handleExceptions(Exception e) {
     if (e is DioServerException) {
      return  "url Launching Error";
    } else if (e is InternetConnectionException) {
      return "check Your Internet Connection";
    } else if (e is TimeOutOperationsException) {
      return "operation TimedOut";
    } else if (e is URLLauncherException) {
      return "url Launching Error";
    } else {
      return "someThing Went Wrong";
    }
  }
}
