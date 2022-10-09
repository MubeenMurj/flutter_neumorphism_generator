import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../main_layout/responsive.dart';
import '../../../../generator_controller.dart';

class SliderRow extends StatelessWidget {
  final int labelDecimals;
  final double value, min, max;
  final Function(double value) onChanged;
  final String label;
  SliderRow({
    Key? key,
    this.labelDecimals = 0,
    required this.value,
    required this.onChanged,
    required this.label,
    this.min = 0,
    this.max = 100,
  }) : super(key: key);

  final GeneratorController generator = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
            vertical: Responsive.isMobile(context) ? 2.0 : 8.0),
        child: Row(
          children: [
            Text(
              '$label: ',
              style: TextStyle(
                fontSize: Responsive.isMobile(context) ? 12 : 18,
                color: generator.getPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: const RectangularSliderTrackShape(),
                  trackHeight: 6,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 12.0),
                ),
                child: Slider(
                  value: value,
                  onChanged: onChanged,
                  min: min,
                  max: max,
                  activeColor: generator.getPrimaryColor,
                  inactiveColor: generator.getPrimaryColor,
                ),
              ),
            ),
            Text(
              value.toStringAsFixed(labelDecimals),
              style: TextStyle(
                fontSize: Responsive.isMobile(context) ? 12 : 18,
                color: generator.getPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
