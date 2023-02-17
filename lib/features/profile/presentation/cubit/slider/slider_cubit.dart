import '../../../../../core/export/export.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  double _initialValue = 0.0;

  double get sliderValue => _initialValue;

  void setValue(double val) {
    _initialValue = val;
    emit(SliderInitial());
  }
}
