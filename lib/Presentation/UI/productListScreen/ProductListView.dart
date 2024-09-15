import 'package:flutter/material.dart';
import 'package:flutter_task_cycle_one/Core/BaseState.dart';
import 'package:flutter_task_cycle_one/Domain/UseCase/GetAllProductsUseCase.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/ProductListNavigator.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/ProductListViewModel.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/widgets/ProductCard.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  static const String routeName = 'productScreen';

  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState
    extends BaseState<ProductListScreen, ProductListViewModel>
    implements ProductListNavigator {
  @override
  void initState() {
    super.initState();
    viewModel.getAllProducts();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Consumer<ProductListViewModel>(
          builder: (BuildContext context, ProductListViewModel value, Widget? child)  => Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: viewModel.allProductList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < value.allProductList.length) {
                        return ProductCard(
                            productImage:
                            value.allProductList[index].productImage!,
                            productTitle:
                            value.allProductList[index].productTitle!,
                            productPrice:
                            value.allProductList[index].productPrice!,
                            productRating:
                            value.allProductList[index].productRating!);
                      } else {
                        return Container(
                          height: 200,
                          width: 200,
                          color: Colors.lightBlue,
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProductListViewModel initViewModel() {
    return ProductListViewModel(
        getAllProductsUseCase: injectGetAllProductsUseCase());
  }
}
