import 'package:flutter_bloc/flutter_bloc.dart';

class AppStepperViewCubit extends Cubit<int> {
  AppStepperViewCubit() : super(0);
  final int currentStep = 0;

  void goToStep(int step) {
    emit(step);
  }

  void nextStep() {
    emit(state + 1);
  }

  void previousStep() {
    if (state == 0) return;
    emit(state - 1);
  }
}
