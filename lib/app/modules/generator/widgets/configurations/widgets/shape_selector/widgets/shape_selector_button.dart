import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neumorph_calculator/neumorph_calculator.dart';
import '../../../../../../main_layout/responsive.dart';
import '../../../../../generator_controller.dart';

class ShapeSelectorButton extends StatelessWidget {
  final NeumorphShape shape;
  ShapeSelectorButton({
    Key? key,
    required this.shape,
  }) : super(key: key);

  final GeneratorController generator = Get.find();

  String getTooltipMessage() {
    switch (shape) {
      case NeumorphShape.flat:
        return 'Flat';
      case NeumorphShape.concave:
        return 'Concave';
      case NeumorphShape.convex:
        return 'Convex';
      case NeumorphShape.pressed:
        return 'Pressed';
      default:
        return '';
    }
  }

  String getImageName() {
    switch (shape) {
      case NeumorphShape.flat:
        return 'flat';
      case NeumorphShape.concave:
        return 'concave';
      case NeumorphShape.convex:
        return 'convex';
      case NeumorphShape.pressed:
        return 'pressed';
      default:
        return '';
    }
  }

  Color getBgColor() {
    if (shape == generator.shape.value) {
      return generator.getPrimaryColor;
    }
    return generator.getPrimaryColor.withAlpha(200);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Tooltip(
          message: getTooltipMessage(),
          child: GestureDetector(
            onTap: () {
              generator.shape(shape);
            },
            child: Container(
              padding: Responsive.isMobile(context)
                  ? const EdgeInsets.all(10)
                  : const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              height: Responsive.isMobile(context) ? 40 : 50,
              color: getBgColor(),
              child: Center(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    generator.getBgColor,
                    BlendMode.modulate,
                  ),
                  child: Image.asset(
                    'images/${getImageName()}.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
