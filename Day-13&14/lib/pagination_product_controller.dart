import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:my_trial_first_app/Models/product_model.dart';
import 'dio_client/dio_client.dart';

class PaginationProductController extends GetxController {
  final ApiService _apiService = ApiService();

  var isLoading = false.obs;
  var isMoreLoading = false.obs;
  var hasMore = true.obs;
  var product = <ProductModel>[].obs;

  int offset = 0;
  final int limit = 10;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    if (isLoading.value || isMoreLoading.value || !hasMore.value) {
      return;
    }

    if (offset == 0) {
      isLoading(true);
    } else {
      isMoreLoading(true);
    }

    try {
      print("FETCHING OFFSET: $offset");

      final newProducts =
          await _apiService.getProductByPagination(offset, limit);

      print("RECEIVED: ${newProducts.length}");

      if (newProducts.length < limit) {
        hasMore(false);
      }

      product.addAll(newProducts);
      offset += limit;
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      isMoreLoading(false);
    }
  }
}
