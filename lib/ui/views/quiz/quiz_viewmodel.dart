import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/models/quiz.dart';
import '../../../app/models/topic.dart';
import '../../../app/services/firebase/firestore_service.dart';

class QuizViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  // Timer
  Timer? _timer;
  int ticker = 0, maxSecond = 30;

  // Quiz
  List<Quiz> listQuiz = [];
  int currentQuizIndex = 0;

  void startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) async {
      ticker++;
      notifyListeners();

      if (ticker == maxSecond) {
        cancelFlashTimer();
        selectAnswer("");
      }
    });
  }

  void cancelFlashTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      ticker = 0;
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
    _navigationService.navigateTo(Routes.scoreView,
        arguments: ScoreViewArguments(quizList: listQuiz));
  }

  void selectAnswer(String answer) {
    cancelFlashTimer();

    listQuiz[currentQuizIndex].answer = answer;

    if (currentQuizIndex == listQuiz.length - 1) {
      return navigateToScore();
    }

    currentQuizIndex++;
    notifyListeners();

    startTimer();
  }

  void initialQuiz(String? topicName) async {
    startTimer();

    // Get Topics
    final List<Topic> topics =
        await runBusyFuture(_firestoreService.getTopics());
    // Shuffle topics
    topics.shuffle();

    final String selectedTopic = topicName ?? (topics[0].name ?? '');

    // Get list Quiz by topic name
    final resultGetQuiz =
        await runBusyFuture(_firestoreService.getQuizzes(selectedTopic));
    // Shuffle quiz
    resultGetQuiz.shuffle();
    listQuiz = resultGetQuiz;
    notifyListeners();
  }

  @override
  void dispose() {
    cancelFlashTimer();
    super.dispose();
  }
}
