import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../../../../../../core/export/export.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Injection.imageCubit.pickImgae(
          ImagePickingChoice.gallery,
        );
      },
      child: Center(
        child: Stack(
          children: [
            BlocBuilder<ImageCubit, ImageState>(
              bloc: Injection.imageCubit,
              builder: (context, state) {
                if (state is ImagePicking) {
                  return CircleAvatar(
                    radius: 61.2.h,
                    backgroundColor: white,
                    child: CircleAvatar(
                      backgroundColor: iconBackground,
                      radius: 60.h,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: selectedItemColor,
                        ),
                      ),
                    ),
                  );
                } else if (state is ImagePicked) {
                  print("image show");

                  return CircleAvatar(
                    radius: 61.2.h,
                    backgroundColor: white,
                    child: CircleAvatar(
                      backgroundColor: iconBackground,
                      radius: 60.h,
                      child: state.file != null
                          ? ClipOval(
                              child: Image.file(
                                File(state.file!.path),
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            )
                          : Icon(
                              CupertinoIcons.person_solid,
                              color: white,
                              size: 60.h,
                            ),
                    ),
                  );
                } else if (state is ImageInitial) {
                  return CircleAvatar(
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
                  );
                } else {
                  return CircleAvatar(
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
                  );
                }
              },
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
      ),
    );
  }
}
