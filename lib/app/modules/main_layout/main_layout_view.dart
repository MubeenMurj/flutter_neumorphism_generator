import 'package:cyclop/cyclop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/main_layout/responsive.dart';
import '../generator/generator_controller.dart';
import '../generator/generator_view.dart';
import 'widgets/footer.dart';
import 'widgets/header.dart';

class MainLayoutView extends StatelessWidget {
  final GeneratorController generator = Get.put(GeneratorController());
  MainLayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return EyeDrop(
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: generator.getBgColor,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  if (!Responsive.isMobileAndRotated(context)) Header(),
                  const GeneratorView(),
                  if (!Responsive.isMobileAndRotated(context)) Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
