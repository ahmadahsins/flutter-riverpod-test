import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

// generated notifier providers
@riverpod
class CartNotifier extends _$CartNotifier {
  // Notifier Providers
  // use when you need to update the state & notify consumers
  @override
  Set<Product> build() {
    return {};
  }

  // methods to update state
  void addProducts(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

// dependent provider
@riverpod
int cartTotal(Ref ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;
  for (Product product in cartProducts) {
    total += product.price;
  }
  return total;
}
