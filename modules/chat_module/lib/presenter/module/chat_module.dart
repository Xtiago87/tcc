import 'package:core_module/presenter/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatModules extends Module{

  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind<Object>> get binds => [

  ];


}