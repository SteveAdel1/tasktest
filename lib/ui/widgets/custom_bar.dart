import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cubit.dart';

class CustomProgressBar extends StatelessWidget {
  final int totalSteps;
  final double targetStep;

  CustomProgressBar({required this.targetStep, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      child: BlocBuilder<ProgressCubit, double>(
        builder: (context, currentStep) {
          final double widthFactor = (currentStep / totalSteps).clamp(0.0, 1.0);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<ProgressCubit>().updateProgress(targetStep);
          });

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  totalSteps,
                      (index) => Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 18,
                      color: index + 1 <= currentStep ? Colors.yellow : Colors.green[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 20,
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          color: Colors.green[600],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        height: 20,
                        width: constraints.maxWidth * widthFactor,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFD800),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Positioned(
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          height: 25,
                          width: constraints.maxWidth * widthFactor,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: const Color(0xffFFD800),
                            ),
                          ),
                          padding: EdgeInsets.only(left: constraints.maxWidth * widthFactor - 25),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
