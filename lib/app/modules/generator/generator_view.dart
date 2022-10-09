import 'package:flutter/material.dart';
import '../main_layout/responsive.dart';
import 'widgets/configurations/configurations_box.dart';
import 'widgets/preview/preview_box.dart';

class GeneratorView extends StatelessWidget {
  const GeneratorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Responsive(
        desktop: Row(
          children: [
            const SizedBox(width: 200),
            PreviewBox(),
            const SizedBox(width: 60),
            ConfigurationsBoxWrapper(),
            const SizedBox(width: 200),
          ],
        ),
        tablet: Row(
          children: [
            const SizedBox(width: 20),
            PreviewBox(),
            const SizedBox(width: 60),
            ConfigurationsBoxWrapper(),
            const SizedBox(width: 20),
          ],
        ),
        mobile: Column(
          children: [
            PreviewBox(),
            const SizedBox(height: 10),
            ConfigurationsBoxWrapper(),
          ],
        ),
        mobileRotated: Row(
          children: [
            const SizedBox(width: 0),
            PreviewBox(),
            const SizedBox(width: 10),
            ConfigurationsBoxWrapper(),
            const SizedBox(width: 0),
          ],
        ),
      ),
    );
  }
}
