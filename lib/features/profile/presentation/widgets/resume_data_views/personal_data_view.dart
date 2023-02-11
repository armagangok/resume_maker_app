import 'package:flutter/cupertino.dart';

import '../../../../../core/export/export.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 61.2.h,
                backgroundColor: white,
                child: CircleAvatar(
                  backgroundColor: iconBackground,
                  radius: 60.h,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Icon(
                      CupertinoIcons.person_solid,
                      color: white,
                      size: 60.h,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundColor: white,
                  radius: 18.2.h,
                  child: CircleAvatar(
                    backgroundColor: selectedItemColor,
                    radius: 17.h,
                    child: Icon(
                      CupertinoIcons.camera_on_rectangle,
                      color: white,
                      size: 22.h,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
