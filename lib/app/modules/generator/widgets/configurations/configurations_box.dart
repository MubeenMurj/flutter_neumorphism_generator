import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumorph_calculator/neumorph_calculator.dart';
import '../../../main_layout/responsive.dart';
import '../../generator_controller.dart';
import 'widgets/code_box.dart';
import 'widgets/color_selector.dart';
import 'widgets/shape_selector/shape_selector.dart';
import 'widgets/slider_row/slider_row.dart';

class ConfigurationsBoxWrapper extends StatelessWidget {
  final GeneratorController generator = Get.find();

  ConfigurationsBoxWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: Responsive.isMobile(context) ? 4 : 1,
      child: Responsive.isMobile(context)
          ? ConfigurationsBox()
          : Obx(
              () => Neumorph(
                height: double.infinity,
                width: double.infinity,
                blur: generator.blur.value,
                intensity: generator.intensity.value,
                distance: generator.distance.value,
                color: generator.getBgColor,
                lightSource: generator.lightSource.value,
                shape: NeumorphShape.flat,
                child: ConfigurationsBox(),
              ),
            ),
    );
  }
}

class ConfigurationsBox extends StatelessWidget {
  final GeneratorController generator = Get.find();

  ConfigurationsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: Responsive.isMobile(context)
            ? const EdgeInsets.symmetric(horizontal: 10)
            : const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConfigurationColorsSelector(),
            const SizedBox(height: 10),
            SliderRow(
              label: 'Size',
              value: generator.size.value,
              min: generator.minSize.value,
              max: generator.maxSize.value,
              onChanged: (value) => generator.updateSize(value),
            ),
            SliderRow(
              label: 'Radius',
              value: generator.radius.value,
              min: 0,
              max: generator.maxRadius.value,
              onChanged: (value) {
                generator.radius(value);
              },
            ),
            SliderRow(
              label: 'Distance',
              value: generator.distance.value,
              min: 5,
              max: 50,
              onChanged: (value) {
                generator.distance(value);
              },
            ),
            SliderRow(
              label: 'Intensity',
              value: generator.intensity.value,
              min: 0.1,
              max: 1.0,
              labelDecimals: 1,
              onChanged: (value) {
                generator.intensity(value);
              },
            ),
            SliderRow(
              label: 'Blur',
              value: generator.blur.value,
              min: 0,
              max: 100,
              onChanged: (value) {
                generator.blur(value);
              },
            ),
            ShapeSelector(),
            CodeBox(),
          ],
        ),
      ),
    );
  }
}
