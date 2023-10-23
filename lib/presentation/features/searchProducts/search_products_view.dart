import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants_shop_app/presentation/features/searchProducts/viewmodel/cubit/search_product_viewmodel_cubit.dart';
import 'package:plants_shop_app/presentation/resources/assets_manager.dart';
import 'package:plants_shop_app/presentation/resources/color_manager.dart';
import 'package:plants_shop_app/presentation/resources/font_manager.dart';
import 'package:plants_shop_app/presentation/resources/routes_manager.dart';
import 'package:plants_shop_app/presentation/resources/strings_manager.dart';
import 'package:plants_shop_app/presentation/resources/values_manager.dart';

class SearchProductsView extends StatefulWidget {
  const SearchProductsView({super.key});

  @override
  State<SearchProductsView> createState() => _SearchProductsViewState();
}

class _SearchProductsViewState extends State<SearchProductsView> {
  final SearchProductViewmodelCubit searchProductViewmode =
      SearchProductViewmodelCubit();

  void _bind() {
    searchProductViewmode.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchProductViewmode,
      child: _getContentWidget(),
    );
  }
}

Widget _getContentWidget() {
  return Builder(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: AppSize.s65,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          AppStrings.searchProducts,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          children: [
            _searchBar(),
            const SizedBox(height: AppSize.s10),
            Expanded(child: (_itemsList())),
          ],
        ),
      ),
    );
  });
}

Widget _searchBar() {
  return Row(
    children: [
      Expanded(
        child: TextField(
          style: const TextStyle(fontSize: FontSize.s16),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(AppPadding.p11),
              child: SvgPicture.asset(
                colorFilter:
                    ColorFilter.mode(lightColorScheme.outline, BlendMode.srcIn),
                ImagesAssets.search,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: AppSize.s12),
      Container(
        decoration: BoxDecoration(
            color: lightColorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(AppSize.s12),
            border: Border.all(
              color: lightColorScheme.primaryContainer,
              width: AppSize.s2,
            )),
        // ? Settings buttons
        padding: const EdgeInsets.all(AppPadding.p10),
        child: SvgPicture.asset(
          ImagesAssets.settings,
          height: AppSize.s30,
          width: AppSize.s30,
        ),
      )
    ],
  );
}

Widget _itemsList() {
  return BlocBuilder<SearchProductViewmodelCubit, SearchProductViewmodelState>(
    builder: (context, state) {
      if (state is Products) {
        return SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ? left column
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: AppSize.s150,
                    alignment: Alignment.bottomCenter,
                    height: AppSize.s80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Found",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: FontSize.s27)),
                        Row(
                          children: [
                            Text((state.numberOfProducts).toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: FontSize.s27)),
                            const SizedBox(width: AppSize.s6),
                            Text("Results",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: FontSize.s27)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: List<Widget>.generate(state.numberOfProducts ~/ 2,
                        (int i) {
                      return _itemCard(
                        price: state.productsList[i].price,
                        image: state.productsList[i].image,
                        productname: state.productsList[i].productName,
                      );
                    }),
                  )
                ],
              ),
              // ? right column
              Column(
                children: List<Widget>.generate(
                    state.numberOfProducts ~/ 2 + state.numberOfProducts % 2,
                    (int i) {
                  return _itemCard(
                    price: state
                        .productsList[i + state.numberOfProducts ~/ 2].price,
                    image: state
                        .productsList[i + state.numberOfProducts ~/ 2].image,
                    productname: state
                        .productsList[i + state.numberOfProducts ~/ 2]
                        .productName,
                  );
                }),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    },
  );
}

Widget _itemCard(
    {required String price,
    required String image,
    required String productname}) {
  return Builder(builder: (context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.viewProduct, arguments: {
        "image": image,
        "price": price,
        "productname": productname
      }),
      child: Container(
        margin: const EdgeInsets.only(top: AppMargin.m12, bottom: AppMargin.m4),
        height: AppSize.s290,
        width: AppSize.s160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s24),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              height: AppSize.s170,
            ),
            Text(
              productname,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ $price",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeightManager.extraBold),
                  ),
                  SvgPicture.asset(
                    ImagesAssets.favorite,
                    height: AppSize.s35,
                    width: AppSize.s35,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  });
}
