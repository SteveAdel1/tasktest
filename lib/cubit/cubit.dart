import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressCubit extends Cubit<double> {
  ProgressCubit() : super(1.0); // Start with a default value

  void updateProgress(double targetStep) {
    emit(targetStep.clamp(1.0, double.infinity)); // Update the current step, ensuring it doesn't go below 1.0
  }
}
