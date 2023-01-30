import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_maker_app/core/extension/context_extension.dart';

import '../../../../core/widget/tab_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          SliverAppBar(
            title: const Text('Resume Maker App'),
            pinned: true,
            floating: true,
            toolbarHeight: context.height(0.05),
            bottom: AppBar(
              title: const HomeTabBarWidget(),
            ),
          ),
        ],
        body: ListView.separated(
          itemBuilder: (context, index) {
            return null;
          },
          separatorBuilder: (context, index) {
            return const SizedBox();
          },
          itemCount: 5,
        ),
      ),
    );
  }
}

class HomeTabBarWidget extends ConsumerWidget {
  const HomeTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tabBar = ref.watch(tabBarProvider);
    return TabBarWidget(
      widgetList: [
        ExpandedItem(
          text: "text",
          clickedNumber: 0,
          onTap: () {
            tabBar.setIndex = 0;
          },
        ),
        ExpandedItem(
          text: "text",
          clickedNumber: 1,
          onTap: () {
            tabBar.setIndex = 1;
          },
        ),
        ExpandedItem(
          text: "text",
          clickedNumber: 2,
          onTap: () {
            tabBar.setIndex = 2;
          },
        ),
      ],
    );
  }
}

                    // InkWell(
                    //   onTap: () {},
                    //   child: Tab(
                    //     height: context.height(0.075),
                    //     icon: const Icon(Icons.home_filled),
                    //     text: 'Home',
                    //   ),
                    // ),
                    // Tab(
                    //   height: context.height(0.075),
                    //   icon: const Icon(Icons.person),
                    //   text: 'My Profile',
                    // ),
                    // Tab(
                    //   height: context.height(0.075),
                    //   icon: const Icon(Icons.settings),
                    //   text: 'Settings',
                    // ),