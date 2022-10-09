import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../main_layout/responsive.dart';
import '../../../generator_controller.dart';

class ConfigurationColorsSelector extends StatelessWidget {
  final GeneratorController generator = Get.find();

  ConfigurationColorsSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Pick a color:',
          style: TextStyle(
            fontSize: Responsive.isMobile(context) ? 12 : 18,
            color: generator.getPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 14),
        Obx(
          () => ColorButton(
            color: generator.getBgColor,
            config: const ColorPickerConfig(enableEyePicker: true),
            boxShape: BoxShape.rectangle,
            size: Responsive.isMobile(context) ? 28 : 34,
            onColorChanged: (value) => generator.setBgColor = value,
          ),
        ),
        const SizedBox(width: 14),
        Text(
          'or',
          style: TextStyle(
            fontSize: Responsive.isMobile(context) ? 12 : 16,
            color: generator.getPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 14),
        Container(
          width: 100,
          color: Colors.white,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: Responsive.isMobile(context)
                  ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                  : const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              isDense: true,
              prefixText: '#',
              prefixStyle: TextStyle(
                fontSize: Responsive.isMobile(context) ? 12 : 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF001F3F),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                borderSide:
                    BorderSide(color: generator.getPrimaryColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                borderSide:
                    BorderSide(color: generator.getPrimaryColor, width: 2.0),
              ),
            ),
            style: TextStyle(
              fontSize: Responsive.isMobile(context) ? 12 : 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF001F3F),
            ),
            controller: generator.colorController,
            onChanged: (value) {
              if (value.length == 6) {
                int colorValue = int.parse('0xFF' + value);
                generator.setBgColor = Color(colorValue);
              }
            },
          ),
        ),
      ],
    );
  }
}
