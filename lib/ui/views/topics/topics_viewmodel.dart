import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/models/topic.dart';
import '../../../app/services/firebase/firestore_service.dart';

class TopicsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  final TextEditingController searchController = TextEditingController();

  List<Topic> topics = [], listTopics = [];

  void getTopics() async {
    final result = await _firestoreService.getTopics();

    topics = result;
    listTopics = result;

    notifyListeners();
  }

  void findTopic(String topic) {
    listTopics = [];
    listTopics = topic.length > 3 && topic.isNotEmpty
        ? topics.where((data) => data.name!.contains(topic)).toList()
        : topics;
    notifyListeners();
  }

  void onChanged(String value) {
    findTopic(value);
  }

  void navigateToQuiz(String topic) {
    _navigationService.navigateTo(Routes.quizView);
  }
}
