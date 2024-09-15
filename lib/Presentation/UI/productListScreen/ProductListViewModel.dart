import 'package:flutter_task_cycle_one/Core/BaseViewModel.dart';
import 'package:flutter_task_cycle_one/Domain/Models/ProductResponse.dart';
import 'package:flutter_task_cycle_one/Domain/UseCase/GetAllProductsUseCase.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/ProductListNavigator.dart';

class ProductListViewModel extends BaseViewModel<ProductListNavigator>{
  GetAllProductsUseCase getAllProductsUseCase;

  ProductListViewModel({required this.getAllProductsUseCase});

  List<ProductResponse> allProductList = [];
  String? errorMessage;

  void getAllProducts() async {
    errorMessage = null;
    try {
      var response = await getAllProductsUseCase.invoke();
      for (int i = 0; i < response!.length; i++) {
        allProductList.add(response[i]);
      }
      print(allProductList);
      print("1");
      notifyListeners();

    } catch (e) {
      errorMessage = handleExceptions(e as Exception);
      notifyListeners();
    }
    return null;
  }
}
