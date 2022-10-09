import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumorph_calculator/neumorph_calculator.dart';
import '../../../main_layout/responsive.dart';
import '../../generator_controller.dart';
import 'widgets/light_direction_selector.dart';

class PreviewBox extends StatelessWidget {
  final GeneratorController generator = Get.find();

  PreviewBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: Responsive.isMobile(context) ? 3 : 1,
      child: SizedBox(
        height: 500,
        width: 500,
        child: Obx(
          () => Stack(
            children: [
              Center(
                child: Neumorph(
                  blur: generator.blur.value,
                  height: generator.size.value,
                  width: generator.size.value,
                  intensity: generator.intensity.value,
                  radius: generator.radius.value,
                  distance: generator.distance.value,
                  color: generator.getBgColor,
                  lightSource: generator.lightSource.value,
                  shape: generator.shape.value,
                ),
              ),
              LightDirectionSelector(
                position: Alignment.topLeft,
              ),
              LightDirectionSelector(
                position: Alignment.topRight,
              ),
              LightDirectionSelector(
                position: Alignment.bottomLeft,
              ),
              LightDirectionSelector(
                position: Alignment.bottomRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
