import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../main_layout/responsive.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';
import '../../../generator_controller.dart';
import 'package:flutter/services.dart';

class CodeBox extends StatelessWidget {
  final GeneratorController generator = Get.find();

  CodeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Container(
          padding: const EdgeInsets.all(6),
          height: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: generator.codeBgColor.value,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: Responsive.isMobile(context) ? 12.0 : 14.0,
                        ),
                        children: <TextSpan>[
                          DartSyntaxHighlighter(generator.codeTheme.value)
                              .format(generator.getCode),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF138D75),
                    ),
                  ),
                  onPressed: () =>
                      Clipboard.setData(ClipboardData(text: generator.getCode)),
                  child: const Text('Copy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
