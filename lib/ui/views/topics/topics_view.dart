import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'topics_viewmodel.dart';
import 'widgets/topic_item.dart';

class TopicsView extends StackedView<TopicsViewModel> {
  const TopicsView({super.key});

  @override
  Widget builder(
      BuildContext context, TopicsViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Topics"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        padding: EdgeInsets.only(bottom: 42.h),
        width: double.maxFinite,
        height: double.maxFinite,
        child: ListView(
          children: [
            // TODO: Replace with category from DB
            for (int index = 0; index < 100; index++) const TopicItem(),
          ],
        ),
      ),
    );
  }

  @override
  TopicsViewModel viewModelBuilder(BuildContext context) => TopicsViewModel();
}
