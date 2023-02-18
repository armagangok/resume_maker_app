import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker_app/core/extension/context_extension.dart';
import 'package:resume_maker_app/core/injection/injection_service.dart';
import 'package:resume_maker_app/core/navigation/constant/routes.dart';
import 'package:resume_maker_app/core/theme/constants/colors.dart';
import 'package:resume_maker_app/core/widget/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _createResumeButton(),
      ],
    );
  }

  Widget _createResumeButton() {
    return Padding(
      padding: EdgeInsets.all(30.h),
      child: CustomContainer(
        borderRadius: BorderRadius.zero,
        borderColor: iconColor,
        color: primaryColor,
        child: SizedBox(
          height: 80.h,
          child: InkWell(
            onTap: () {
              Injection.navigator.navigateTo(path: rootPage);
            },
            child: Center(
              child: Text(
                "CREATE RESUME",
                style: context.displayMedium.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu_rounded,
        ),
      ),
    );
  }
}
