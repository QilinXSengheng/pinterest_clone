import 'package:flutter/material.dart';
import 'package:pinterest_clone/initializer.dart';
import 'package:pinterest_clone/my_app.dart';
import 'package:pinterest_clone/widgets/app_scope.dart';

//nb=
bool sel1 = true;
int b = 0;
int page = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.load();

  runApp(
    AppScope(builder: (context) => const MyApp()),
  );
}
