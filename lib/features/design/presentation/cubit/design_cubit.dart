// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_function_literals_in_foreach_calls
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'design_state.dart';

class DesignCubit extends Cubit<DesignState> {
  DesignCubit() : super(DesignInitial());

  final int _selectedColorIndex = 0;

  int get selectedColorIndex => _selectedColorIndex;

  void selectIndex(int index) {
    resumeColors.forEach((element) {
      element.isSelected = false;
    });
    resumeColors[index].isSelected = true;
    emit(DesignInitial());
  }

  List<ResumeColorModel> resumeColors = [
    ResumeColorModel(color: Colors.grey, isSelected: true),
    ResumeColorModel(
      color: const Color(0xffFF9E9E),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color(0xffEB3223),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color(0xff343859),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color(0xff91F48F),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color(0xffFFF599),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color(0xff9EFFFF),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color(0xffB69CFF),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color(0xff9a32d2),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color.fromARGB(248, 0, 97, 11),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color.fromARGB(248, 62, 0, 63),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color.fromARGB(248, 255, 228, 183),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color.fromARGB(248, 96, 0, 0),
      isSelected: false,
    ),
    ResumeColorModel(
      color: const Color.fromARGB(248, 208, 208, 255),
      isSelected: false,
    ),
  ];
}

class ResumeColorModel {
  bool isSelected;
  final Color color;

  ResumeColorModel({
    required this.color,
    this.isSelected = false,
  });
}
