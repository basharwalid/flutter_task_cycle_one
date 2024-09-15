import 'package:flutter/material.dart';
import 'package:flutter_task_cycle_one/Core/BaseNavigator.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/DioExceptions.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/InternetConnectionException.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/TimeOutOperationsException.dart';
import 'package:flutter_task_cycle_one/Domain/Exceptions/URLLauncherException.dart';

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
