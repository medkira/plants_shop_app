import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plants_shop_app/domain/model/models.dart';
import 'package:plants_shop_app/presentation/features/onboarding/viewmodel/cubit/onboarding_viewmodel_cubit.dart';
import 'package:plants_shop_app/presentation/resources/assets_manager.dart';
import 'package:plants_shop_app/presentation/resources/color_manager.dart';
import 'package:plants_shop_app/presentation/resources/font_manager.dart';
import 'package:plants_shop_app/presentation/resources/routes_manager.dart';
import 'package:plants_shop_app/presentation/resources/strings_manager.dart';
import 'package:plants_shop_app/presentation/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final OnboardingViewmodelCubit onboardingViewModel =
      OnboardingViewmodelCubit();

  void _bind() {
    onboardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocProvider(
      create: (context) => onboardingViewModel,
      child: BlocBuilder<OnboardingViewmodelCubit, OnboardingViewmodelState>(
        builder: (context, state) {
          if (state is OnboardingSliderObject) {
            return _getContentWidget(state);
          } else {
            return const Placeholder();
          }
        },
      ),
    );
  }
}

Widget _getContentWidget(OnboardingSliderObject onboardingSliderObject) {
  final PageController pageController = PageController(initialPage: 0);

  return Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: AppSize.s50,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            // ? skip button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppMargin.m18),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.searchProducts);
                },
                child: const Text(
                  AppStrings.skip,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.64,
                    child: PageView.builder(
                      itemCount: onboardingSliderObject.numberOfSlide,
                      controller: pageController,
                      itemBuilder: ((context, index) {
                        return _onBoardingImageAndText(
                            onboardingSliderObject.sliderObject[index]);
                      }),
                    ),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height * 0.51),
                    right: 0,
                    left: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        effect: ExpandingDotsEffect(
                          activeDotColor: lightColorScheme.primary,
                          spacing: AppSize.s4,
                          dotHeight: AppSize.s6,
                          dotWidth: AppSize.s6,
                        ),
                        controller: pageController,
                        count: onboardingSliderObject.numberOfSlide,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s40),
              SizedBox(
                height: AppSize.s100,
                width: AppSize.s100,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(lightColorScheme.primary)),
                  onPressed: () {
                    pageController.animateToPage(
                      pageController.page!.toInt() + 1,
                      duration: const Duration(
                          milliseconds: 350), // Animation duration
                      curve: Curves.ease,
                    );

                    if (pageController.page!.toInt() ==
                        onboardingSliderObject.numberOfSlide - 1) {
                      Navigator.pushNamed(context, Routes.searchProducts);
                    }
                  },
                  child: Center(
                    child: SvgPicture.asset(ImagesAssets.arrowRight,
                        height: AppSize.s70),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _onBoardingImageAndText(SliderObject sliderObject) {
  return Builder(
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            sliderObject.image,
            height: MediaQuery.of(context).size.height * 0.46,
          ),
          const SizedBox(height: AppSize.s60),
          if (sliderObject.title == AppStrings.onBoardingTitle1) ...[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: AppStrings.onBoardingTitle1,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).size.height /
                              AppSize.s26)),
                  TextSpan(
                      text: AppStrings.onBoardingTitle1Blod,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeightManager.extraBold,
                          fontSize:
                              MediaQuery.of(context).size.height / AppSize.s26))
                ],
              ),
            )
          ] else ...[
            Text(
              sliderObject.title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: MediaQuery.of(context).size.height / AppSize.s26),
            ),
          ]
        ],
      );
    },
  );
}

// Widget _onBoardingText(SliderObject sliderObject) {
//   return Builder(builder: (context) {
//     return Text(
//       sliderObject.title,
//       textAlign: TextAlign.center,
//       style: Theme.of(context).textTheme.displayLarge,
//     );
//   });
// }

// class Carousel extends StatefulWidget {
//   @override
//   _CarouselState createState() => _CarouselState();
// }

// class _CarouselState extends State<Carousel> {
//   final PageController _pageController = PageController();
//   final PageController _pageController1 = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           FloatingActionButton(onPressed: () {
//             print(_pageController.page?.round() ?? 0);
//             print(_pageController1.page?.round() ?? 0);
//             int index = _pageController.page?.round() ?? 0;
//             // _pageController.jumpToPage(index + 1);
//             // _pageController1.jumpToPage(index +  1);

//             _pageController1.animateToPage(
//               index + 1,
//               duration: Duration(milliseconds: 350), // Animation duration
//               curve: Curves.ease,
//             );
//             _pageController.animateToPage(
//               index + 1,
//               duration: Duration(milliseconds: 360), // Animation duration
//               curve: Curves.ease,
//             );
//           }),
//           Expanded(
//             child: PageView(
//               onPageChanged: (value) {
//                 // _pageController1.jumpToPage(value);
//               },
//               controller: _pageController,
//               children: [
//                 Container(
//                   color: Colors.red,
//                   child: Center(
//                     child: Text('Page 1'),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.blue,
//                   child: Center(
//                     child: Text('Page 2'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: PageView(
//               onPageChanged: (value) {
//                 _pageController.animateToPage(
//                   value,
//                   duration: Duration(milliseconds: 350), // Animation duration
//                   curve: Curves.ease,
//                 );
//                 // print("hi");
//                 // _pageController.jumpToPage(value);
//               },
//               controller: _pageController1,
//               children: [
//                 Container(
//                   color: Colors.yellow,
//                   child: Center(
//                     child: Text('Page 3'),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.green,
//                   child: Center(
//                     child: Text('Page 4'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
