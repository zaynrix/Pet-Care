import 'package:flutter/material.dart';
import 'package:pet_care/features/shop/controllers/product_provider.dart';
import 'package:pet_care/features/shop/models/product_model.dart';
import 'package:pet_care/locator.dart';

class SearchProvider extends ChangeNotifier {
  bool replace = false;
  String querySearch = '';
  TextEditingController searchController = TextEditingController();
  List<SingleProduct> searchList = [];
  final homeProvider = sl<ProductController>();
  void replaceIt() {
    replace = !replace;
    notifyListeners();
  }

  void filterList(String query) {
    if (query.isEmpty) {
      // If the query is empty, display all items from the original list
      searchList = List.from(homeProvider.products!.products!);
      notifyListeners();

      print("This value querty $query");
      print("lentgh ${searchList.length}");
    } else {
      querySearch = query;
      // Filter the original list based on the search query
      searchList = homeProvider.products!.products!
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      notifyListeners();
    }
  }
}
