import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/mixins/comon_mixin.dart';

class HomeViewModel extends BaseViewModel with CommonMixin {
  final NavigationService _navigationService = locator<NavigationService>();

  final urlShare = "https://github.com/egin10/quiz_app";

  void navigateToQuiz() {
    _navigationService.navigateTo(Routes.quizView);
  }

  void navigateToTopics() {
    _navigationService.navigateTo(Routes.topicsView);
  }

  void shareApp() async {
    share(urlShare);
  }

  void rateApp() async {
    share(urlShare);
  }
}
