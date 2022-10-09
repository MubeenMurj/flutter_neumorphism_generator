import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../generator/generator_controller.dart';
import '../responsive.dart';

class Header extends StatelessWidget {
  final GeneratorController generator = Get.find();

  Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: Responsive.isMobile(context)
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 0)
            : const EdgeInsets.only(top: 10, bottom: 30),
        child: Column(
          children: [
            Text(
              'Neumorphism Generator',
              style: TextStyle(
                fontSize: Responsive.isMobile(context) ? 20 : 32,
                color: generator.getPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (!Responsive.isMobile(context)) const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: Responsive.isMobile(context) ? 16 : 20,
                  color: generator.getPrimaryColor,
                  fontWeight: FontWeight.w400,
                ),
                children: const [
                  TextSpan(
                    text: 'Generate',
                  ),
                  TextSpan(
                    text: ' Soft',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '-UI Flutter Code',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
