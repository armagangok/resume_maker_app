// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_function_literals_in_foreach_calls
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/item.dart';

part 'color_picker_state.dart';

class ColorPickerCubit extends Cubit<ColorPickerState> {
  ColorPickerCubit() : super(ColorPickerInitial());

  void selectIndex(int index) {
    resumeColors.forEach((element) {
      element.colorModel.isSelected = false;
    });
    resumeColors[index].colorModel.isSelected = true;
    emit(ColorPickerInitial());
  }

  Color get selectedColor {
    for (var element in resumeColors) {
      if (element.colorModel.isSelected) {
        return element.colorModel.color;
      }
    }
    return const Color(0x000000ff);
  }

  List<ResumeColorItem> resumeColors = [
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(248, 208, 208, 255),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xff343859),
        isSelected: true,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xffEB3223),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(255, 2, 134, 0),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(255, 0, 105, 89),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(255, 0, 19, 228),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(255, 93, 0, 200),
        isSelected: false,
      ),
    ),
  ];
}
