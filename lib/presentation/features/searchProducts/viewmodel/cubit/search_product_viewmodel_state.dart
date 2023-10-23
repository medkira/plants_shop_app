part of 'search_product_viewmodel_cubit.dart';

@immutable
sealed class SearchProductViewmodelState {}

final class SearchProductViewmodelInitial extends SearchProductViewmodelState {}

final class Products extends SearchProductViewmodelState {
  final List<Product> productsList;
  final int numberOfProducts;
  Products(this.productsList, this.numberOfProducts);
}
