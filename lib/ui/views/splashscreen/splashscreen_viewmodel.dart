import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class SplashScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Timer? _timer;
  int second = 3;

  void startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) async {
      second--;

      if (second == 0) {
        cancelFlashTimer();
        _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
      }
    });
    notifyListeners();
  }

  void cancelFlashTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    cancelFlashTimer();
    super.dispose();
  }
}
