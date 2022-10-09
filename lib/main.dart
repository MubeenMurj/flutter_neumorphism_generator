import 'package:flutter/material.dart';
import 'app/modules/main_layout/main_layout_view.dart';

void main() {
  runApp(const NGApp());
}

class NGApp extends StatelessWidget {
  const NGApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Neumorphism Generator',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: const MaterialColor(0xFF001F3F, {
            50: Color(0xFF001F3F),
            100: Color(0xFF001F3F),
            200: Color(0xFF001F3F),
            300: Color(0xFF001F3F),
            400: Color(0xFF001F3F),
            500: Color(0xFF001F3F),
            600: Color(0xFF001F3F),
            700: Color(0xFF001F3F),
            800: Color(0xFF001F3F),
            900: Color(0xFF001F3F),
          }),
        ),
        home: MainLayoutView(),
      ),
    );
  }
}
