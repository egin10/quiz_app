import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/quiz/quiz_view.dart';
import '../ui/views/score/score_view.dart';
import '../ui/views/splashscreen/splashscreen_view.dart';
import '../ui/views/topics/topics_view.dart';
import 'services/firebase/firestore_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashScreenView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: QuizView),
  MaterialRoute(page: TopicsView),
  MaterialRoute(page: ScoreView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: FirestoreService),
])
class App {}
