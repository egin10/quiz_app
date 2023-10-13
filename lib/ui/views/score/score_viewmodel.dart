import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/mixins/comon_mixin.dart';
import '../../../app/models/quiz.dart';

class ScoreViewModel extends BaseViewModel with CommonMixin {
  final NavigationService _navigationService = locator<NavigationService>();

  final urlShare = "https://github.com/egin10/quiz_app";

  void navigateToHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  double countAnswer(List<Quiz> list, {bool isCorrect = false}) {
    return isCorrect
        ? list
            .where((quiz) => quiz.answer == quiz.correctAnswer)
            .toList()
            .length
            .toDouble()
        : list
            .where((quiz) => quiz.answer != quiz.correctAnswer)
            .toList()
            .length
            .toDouble();
  }

  void shareResult() => share(urlShare);
}
