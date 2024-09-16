import 'package:flutter_task_cycle_one/Core/base_viewModel.dart';
import 'package:flutter_task_cycle_one/Domain/Models/product_response.dart';
import 'package:flutter_task_cycle_one/Domain/UseCase/get_all_products_usecase.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/product_list_Navigator.dart';

class ProductListViewModel extends BaseViewModel<ProductListNavigator> {
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
      notifyListeners();
    } catch (e) {
      errorMessage = handleExceptions(e as Exception);
      notifyListeners();
    }
    return null;
  }
}
