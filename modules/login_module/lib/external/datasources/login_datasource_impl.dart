import 'package:core_module/core_module.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:core_module/infra/models/medico_model.dart';
import 'package:core_module/infra/models/paciente_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_module/infra/datasources/ilogin_datasource.dart';
import 'package:login_module/infra/datasources/remote/ilogin_datasource_remote.dart';

import '../../domain/entities/login_form_entity.dart';

class LoginDatasourceImpl extends ILoginDatasource {
  final ILoginDataSourceRemote iLoginDataSourceRemote;
  final PerfilDatasourceImpl perfilDatasourceImpl =
  Modular.get<PerfilDatasourceImpl>();

  LoginDatasourceImpl(this.iLoginDataSourceRemote);

  @override
  Future login(LoginFormEntity loginFormEntity) async {
    try {
      final response = await iLoginDataSourceRemote.login(loginFormEntity);

      await perfilDatasourceImpl.savePerfil(PerfilModel(
        email: response.email,
        fullName: response.fullName,
        id: response.id.toString(),
        photo: response.photo,
        uid: response.uid
      ));

      return true;
    } on Failure {
      rethrow;
    }
  }
}
