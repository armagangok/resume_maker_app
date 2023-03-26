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
        color: Colors.grey,
        isSelected: true,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xffFF9E9E),
        isSelected: false,
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
        color: const Color(0xffFF9E9E),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xff343859),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xff91F48F),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xffFFF599),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xff9EFFFF),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xffFFF599),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xffB69CFF),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xffFFF599),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color(0xff9a32d2),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(248, 0, 97, 11),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(248, 255, 228, 183),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(248, 96, 0, 0),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(248, 208, 208, 255),
        isSelected: false,
      ),
    ),
    ResumeColorItem(
      colorModel: ResumeColorModel(
        color: const Color.fromARGB(248, 208, 208, 255),
        isSelected: false,
      ),
    ),
  ];
}
