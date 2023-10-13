import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../shared/custom_textfield.dart';
import 'topics_viewmodel.dart';
import 'widgets/topic_item.dart';

class TopicsView extends StackedView<TopicsViewModel> {
  const TopicsView({super.key});

  @override
  void onViewModelReady(TopicsViewModel viewModel) {
    viewModel.getTopics();
    super.onViewModelReady(viewModel);
  }

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
        child: Column(
          children: [
            CustomTextField(
              controller: viewModel.searchController,
              onChanged: (value) => viewModel.onChanged(value),
            ),
            SizedBox(height: 26.h),
            viewModel.listTopics.isNotEmpty
                ? Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (int index = 0;
                            index < viewModel.listTopics.length;
                            index++)
                          TopicItem(
                            name: viewModel.listTopics[index].name ?? 'Unknown',
                          ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text("Topic not found."),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  TopicsViewModel viewModelBuilder(BuildContext context) => TopicsViewModel();
}
