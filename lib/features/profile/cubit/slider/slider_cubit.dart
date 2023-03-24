import '../../../../../core/export/export.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  String _setText = "";

  set setText(String value) => _setText = value;

  String get getText => _setText;

  double _initialValue = 0.0;

  double get sliderValue => _initialValue;

  void setValue(double val) {
    _initialValue = val;
    emit(SliderInitial());
  }
}
