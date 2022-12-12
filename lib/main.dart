import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'app/presenter/app_page.dart';

void main() => runApp(ModularApp(module: AppModule(), child: const AppPage()));
