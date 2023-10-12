import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class QuizViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  void navigateExit() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }
}
