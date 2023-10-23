import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/cupertino_Page.dart';

class AppCupertino extends StatelessWidget {
final _themeDark = const CupertinoThemeData.raw(
  Brightness.dark,
  null,
  null,
  null,
  null,
  null,
  null,
  );
  
const AppCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _themeDark,
      home: const HomePage(),
    );
  }
}