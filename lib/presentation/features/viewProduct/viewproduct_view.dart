import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plants_shop_app/presentation/resources/assets_manager.dart';
import 'package:plants_shop_app/presentation/resources/color_manager.dart';
import 'package:plants_shop_app/presentation/resources/font_manager.dart';
import 'package:plants_shop_app/presentation/resources/values_manager.dart';

class ViewProductView extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String productname;
  const ViewProductView(
      {super.key,
      required this.imageUrl,
      required this.price,
      required this.productname});

  @override
  Widget build(BuildContext context) {
    return _getContentWidget(imageUrl, productname, price);
  }
}

Widget _getContentWidget(String imageUrl, String productname, String price) {
  return Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: AppSize.s40,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _productImage(imageUrl),
                _productName(productname),
              ],
            ),
            _bottomCard(price),
          ],
        ),
      );
    },
  );
}

Widget _productImage(String image) {
  return Builder(builder: (context) {
    return Container(
      // color: Colors.red,
      child: Image.asset(
        image,
        height: MediaQuery.of(context).size.height / AppSize.s2_5,
      ),
    );
  });
}

Widget _productName(String name) {
  return Builder(builder: (context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.displayLarge,
    );
  });
}

Widget _bottomCard(String price) {
  return Builder(
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: lightColorScheme.primary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s40),
                topRight: Radius.circular(AppSize.s40))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: AppSize.s100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: AppSize.s48,
                        height: AppSize.s48,
                        child: SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                              lightColorScheme.background, BlendMode.srcIn),
                          ImagesAssets.height,
                        ),
                      ),
                      Text(
                        "Height",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                                fontSize: FontSize.s18),
                      ),
                      Text(
                        "30cm-40cm",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: FontSize.s14),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: AppSize.s48,
                        height: AppSize.s48,
                        child: SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                              lightColorScheme.background, BlendMode.srcIn),
                          ImagesAssets.temperature,
                        ),
                      ),
                      Text(
                        "Temperature",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                                fontSize: FontSize.s18),
                      ),
                      Text(
                        "20°c to 25°c",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: FontSize.s14),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: AppSize.s48,
                        height: AppSize.s48,
                        child: SvgPicture.asset(
                          ImagesAssets.pot,
                        ),
                      ),
                      Text(
                        "Pot",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.w600,
                                fontSize: FontSize.s18),
                      ),
                      Text(
                        "Ciramic Pot",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: FontSize.s14),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Total",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: FontSize.s16),
                        ),
                        const SizedBox(width: AppSize.s4),
                        Text(
                          "Price",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontSize: FontSize.s16),
                        ),
                      ],
                    ),
                    Text(
                      "\$$price",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.w900,
                          fontSize: FontSize.s18),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppSize.s28), // Adjust the radius value as needed
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          lightColorScheme.secondaryContainer)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p24, vertical: AppPadding.p32),
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.extraBold),
                      child: const Row(
                        children: [
                          Text('Add'),
                          SizedBox(width: AppSize.s4),
                          Text('to'),
                          SizedBox(width: AppSize.s4),
                          Text('Cart'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
