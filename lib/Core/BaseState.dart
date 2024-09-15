import 'package:flutter/material.dart';
import 'package:flutter_task_cycle_one/Core/BaseNavigator.dart';
import 'package:flutter_task_cycle_one/Core/BaseViewModel.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null;
  }

  @override
  goBack() {
    Navigator.pop(context);
  }
}
