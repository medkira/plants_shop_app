import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:plants_shop_app/domain/model/models.dart';
import 'package:plants_shop_app/presentation/base/baseviewmodel.dart';
import 'package:plants_shop_app/presentation/resources/assets_manager.dart';
import 'package:plants_shop_app/presentation/resources/strings_manager.dart';

part 'onboarding_viewmodel_state.dart';

class OnboardingViewmodelCubit extends Cubit<OnboardingViewmodelState>
    implements BaseViewModel {
  OnboardingViewmodelCubit() : super(OnboardingViewmodelInitial());

  List<SliderObject> _getSliderData() => [
        SliderObject(
            AppStrings.onBoardingTitle1, ImagesAssets.onBoardingImage1),
        SliderObject(
            AppStrings.onBoardingTitle2, ImagesAssets.onBoardingImage2),
        SliderObject(
            AppStrings.onBoardingTitle3, ImagesAssets.onBoardingImage3),
        // SliderObject(
        //     AppStrings.onBoardingTitle4, ImagesAssets.onBoardingImage4),
      ];

  @override
  void start() {
    emit(OnboardingSliderObject(_getSliderData().length, _getSliderData()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
