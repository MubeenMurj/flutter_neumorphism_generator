import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:neumorph_calculator/neumorph_calculator.dart';
import 'package:syntax_highlighter/syntax_highlighter.dart';

class GeneratorController extends GetxController {
  var size = 250.0.obs;
  var minSize = 10.0.obs;
  var maxSize = 350.0.obs;

  var radius = 50.0.obs;
  var maxRadius = 125.0.obs;

  var distance = 20.0.obs;
  var intensity = 0.9.obs;
  var blur = 60.0.obs;

  updateSize(double updatedSize) {
    size(updatedSize);
    if (radius.value > (updatedSize / 2)) {
      radius(updatedSize / 2);
    }
    maxRadius(updatedSize / 2);
    if (updatedSize / 10 >= 5.0) {
      distance(updatedSize / 10);
    }
    blur(updatedSize / 5);
  }

  var lightSource = Alignment.topLeft.obs;

  final _bgColor = const Color(0xFFe0e0e0).obs;
  Color get getBgColor => _bgColor.value;
  set setBgColor(Color value) {
    _bgColor(value);

    colorController.text = value.toString().substring(10, 16);

    if (((value.red * 0.299) + (value.green * 0.587) + (value.blue * 0.114)) >
        186) {
      _primaryColor(const Color(0xFF001F3F));
      codeTheme(SyntaxHighlighterStyle.darkThemeStyle());
      codeBgColor(const Color(0xFF1D1F21));
    } else {
      _primaryColor(const Color(0xFFFfFFFF));
      codeTheme(SyntaxHighlighterStyle.lightThemeStyle());
      codeBgColor(const Color(0xFFF5F2F0));
    }
  }

  final _primaryColor = const Color(0xFF001F3F).obs;
  Color get getPrimaryColor => _primaryColor.value;

  TextEditingController colorController = TextEditingController(text: 'e0e0e0');

  var shape = NeumorphShape.flat.obs;

  var codeTheme = SyntaxHighlighterStyle.darkThemeStyle().obs;
  var codeBgColor = const Color(0xFF1D1F21).obs;

  String _getUpdatedCode() {
    String code = """
      // used neumorph_calculator package
      Neumorph(
            blur: ${blur.value.toStringAsFixed(2)},
            height: ${size.value.toStringAsFixed(2)},
            width: ${size.value.toStringAsFixed(2)},
            intensity: ${intensity.value.toStringAsFixed(2)},
            radius: ${radius.value.toStringAsFixed(2)},
            distance: ${distance.value.toStringAsFixed(2)},
            color: ${_bgColor.value}
            lightSource: ${lightSource.value},
            shape: ${shape.value},
      ),
    """;

    return code;
  }

  String get getCode => _getUpdatedCode();
}
