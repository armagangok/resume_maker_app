import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';

class CircleAvatarWidget extends StatelessWidget {
  final File file;

  const CircleAvatarWidget({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.height(0.2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: FileImage(file),
          ),
        ));
  }
}

class CircleAvatarLoading extends StatelessWidget {
  final DecorationImage decorationImage;

  const CircleAvatarLoading({
    super.key,
    required this.decorationImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height(0.2),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: decorationImage
      ),
    );
  }
}


class ImageLoadingWidget extends StatelessWidget {
  const ImageLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height(0.2),
      width: context.height(0.2),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


class ImageLoadingErrorWidgget extends StatelessWidget {
  const ImageLoadingErrorWidgget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height(0.2),
      width: context.height(0.2),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: context.normalPadding,
        child: Text(
          "Error while uploading image. The picture may have been deleted.",
          style: context.textTheme.bodySmall,
        ),
      ),
    );
  }
}

