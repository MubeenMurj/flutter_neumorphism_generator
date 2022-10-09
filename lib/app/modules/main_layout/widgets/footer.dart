import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../generator/generator_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../responsive.dart';

class Footer extends StatelessWidget {
  final GeneratorController generator = Get.find();

  Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!Responsive.isMobile(context))
            Obx(
              () => RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: generator.getPrimaryColor,
                    fontSize: 14,
                  ),
                  children: const [
                    TextSpan(text: 'Code available on '),
                    TextSpan(
                      text: 'Github',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: '!'),
                  ],
                ),
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              await launchUrl(Uri(
                scheme: 'https',
                host: 'github.com',
                path: '/MubeenMurj/flutter_neumorphism_generator',
              ));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.star,
                  color: Color(0xFFFFC83D),
                ),
                Text(
                  'Start on Github',
                  style: TextStyle(
                    color: Color(0xFF132F4B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
