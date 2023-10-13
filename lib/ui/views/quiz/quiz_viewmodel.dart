import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/models/quiz.dart';

class QuizViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  // Timer
  Timer? _timer;
  int ticker = 0, maxSecond = 60;

  // Quiz
  List<Quiz> listQuiz = [];

  void startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) async {
      ticker++;
      notifyListeners();

      if (ticker == maxSecond) {
        cancelFlashTimer();
        navigateToScore();
      }
    });
  }

  void cancelFlashTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      notifyListeners();
    }
  }

  void navigateBack() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  void navigateExit() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  void navigateToScore() {
    _navigationService.navigateTo(Routes.scoreView);
  }

  @override
  void dispose() {
    cancelFlashTimer();
    super.dispose();
  }
}
