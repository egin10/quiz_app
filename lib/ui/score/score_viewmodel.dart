import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class ScoreViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  void share() async {
    await Share.share("https://github.com/egin10/quiz_app");
  }
}
