import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plants_shop_app/domain/model/models.dart';
import 'package:plants_shop_app/presentation/base/baseviewmodel.dart';
import 'package:plants_shop_app/presentation/resources/assets_manager.dart';

part 'search_product_viewmodel_state.dart';

class SearchProductViewmodelCubit extends Cubit<SearchProductViewmodelState>
    implements BaseViewModel {
  SearchProductViewmodelCubit() : super(SearchProductViewmodelInitial());

  @override
  void start() {
    emit(Products(_getProductsData(), _getProductsData().length));
  }

  List<Product> _getProductsData() => [
        Product("Snake PLants", ImagesAssets.onBoardingImage4, "60.99"),
        Product("Snake PLants", ImagesAssets.onBoardingImage3, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage4, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage1, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage1, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage1, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage1, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage3, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage1, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage1, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage1, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage2, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage1, "14.5"),
        Product("Snake PLants", ImagesAssets.onBoardingImage4, "14.5"),
      ];

  @override
  void dispose() {}
}

abstract class SearchProductsViewModelInouts {
  setUserSearch(String productName);
}
