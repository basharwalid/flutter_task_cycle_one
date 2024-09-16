import 'package:flutter/material.dart';
import 'package:flutter_task_cycle_one/Core/base_state.dart';
import 'package:flutter_task_cycle_one/Domain/UseCase/get_all_products_usecase.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/product_list_Navigator.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/product_list_ViewModel.dart';
import 'package:flutter_task_cycle_one/Presentation/UI/productListScreen/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatefulWidget {
  static const String routeName = 'productScreen';

  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState
    extends BaseState<ProductListView, ProductListViewModel>
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
          builder: (BuildContext context, ProductListViewModel value,
                  Widget? child) =>
              Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items per row
                    crossAxisSpacing: 5.0, // Horizontal spacing between items
                    mainAxisSpacing: 3.0,  // Vertical spacing between items
                    childAspectRatio: 0.75,  // Adjust this ratio based on your item's aspect ratio
                  ),
                  itemCount: viewModel.allProductList.length,
                  itemBuilder: (context, index) {
                    // Ensure index is within bounds
                    if (index < viewModel.allProductList.length) {
                      return ProductCard(
                        productImage: viewModel.allProductList[index].productImage!,
                        productTitle: viewModel.allProductList[index].productTitle!,
                        productPrice: viewModel.allProductList[index].productPrice!,
                        productRating: viewModel.allProductList[index].productRating!, // Use actual rating or modify as needed
                      );
                    } else {
                      return Container(
                        height: 200,
                        width: 200,
                        color: Colors.lightBlue,
                      );
                    }
                  },
                ),
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
