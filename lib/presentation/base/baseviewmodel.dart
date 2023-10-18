abstract class BaseViewModel extends BaseViewModelInputs {
  // *shared variable and function that will be used through any view model.
}

abstract class BaseViewModelInputs {
  void start(); // * start view model job.

  void dispose(); // * will be called when view model dies.
}
