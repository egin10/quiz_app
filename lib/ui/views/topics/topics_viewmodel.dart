import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class TopicsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  // TODO: Replace with category from DB (firestore)
  final List<String> topics = ["Politics", "Animals", "Movies"];

  void navigateToQuiz(String topic) {
    _navigationService.navigateTo(Routes.quizView);
  }
}
