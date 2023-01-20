import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICALCULATOR());
}

class BMICALCULATOR extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff0A0D22),
          appBarTheme: AppBarTheme(
              color: Color(0xFF0A0D22)
          ),
          accentColor: Colors.purple
      ),
      home: InputPage(),
    );
  }
}


