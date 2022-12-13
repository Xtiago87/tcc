import 'package:chat_module/domain/usecase/send_options_message_usecase.dart';
import 'package:chat_module/domain/usecase/send_text_message_usecase.dart';
import 'package:chat_module/external/datasources/message_datasource_impl.dart';
import 'package:chat_module/external/datasources/remote/message_datasource_remote_impl.dart';
import 'package:chat_module/infra/repositories/message_repository_impl.dart';
import 'package:core_module/presenter/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/send_message/send_message_bloc.dart';

class ChatModule extends Module{

  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<Bind<Object>> get binds => [

    Bind.lazySingleton((i) => MessageDatasourceRemoteImpl(), export: true),
    Bind.lazySingleton((i) => MessageDatasourceImpl(i()), export: true),

    Bind.lazySingleton((i) => MessageRepositoryImpl(i()), export: true),

    Bind.lazySingleton((i) => SendTextMessageUsecase(i()), export: true),
    Bind.lazySingleton((i) => SendOptionsMessageUsecase(i()), export: true),

    Bind.factory((i) => SendMessageBloc(), export: true),
  ];


}