part of 'onboarding_viewmodel_cubit.dart';

@immutable
sealed class OnboardingViewmodelState {}

final class OnboardingViewmodelInitial extends OnboardingViewmodelState {}

final class OnboardingSliderObject extends OnboardingViewmodelState {
  final int numberOfSlide;
  final List<SliderObject> sliderObject;
  OnboardingSliderObject(this.numberOfSlide, this.sliderObject);
}
