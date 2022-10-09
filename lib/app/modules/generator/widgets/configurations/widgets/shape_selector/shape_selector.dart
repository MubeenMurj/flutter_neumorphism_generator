import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumorph_calculator/neumorph_calculator.dart';
import '../../../../../main_layout/responsive.dart';
import '../../../../generator_controller.dart';
import 'widgets/shape_selector_button.dart';

class ShapeSelector extends StatelessWidget {
  final GeneratorController generator = Get.find();

  ShapeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Shape:',
            style: TextStyle(
              fontSize: Responsive.isMobile(context) ? 12 : 18,
              color: generator.getPrimaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ShapeSelectorButton(
                shape: NeumorphShape.flat,
              ),
              ShapeSelectorButton(
                shape: NeumorphShape.concave,
              ),
              ShapeSelectorButton(
                shape: NeumorphShape.convex,
              ),
              ShapeSelectorButton(
                shape: NeumorphShape.pressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
