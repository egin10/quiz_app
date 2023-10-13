import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/quiz.dart';
import '../../models/topic.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirestoreService();

  Future<List<Topic>> getTopics() async {
    final result = await firestore.collection("categories").get();

    if (result.docs.isNotEmpty) {
      return result.docs.map((topic) => Topic.fromJson(topic.data())).toList();
    }

    return [];
  }

  Future<List<Quiz>> getQuizzes(String topic) async {
    final result = await firestore
        .collection("quiz")
        .where("category", isEqualTo: topic)
        .get();

    if (result.docs.isNotEmpty) {
      return result.docs.map((quiz) => Quiz.fromJson(quiz.data())).toList();
    }

    return [];
  }
}
