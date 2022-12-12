import 'package:core_module/domain/error/failure.dart';
import 'package:login_module/domain/entities/medico_cadastro_form_entity.dart';
import 'package:login_module/domain/entities/paciente_cadastro_form_entity.dart';
import 'package:login_module/domain/repository/icadastro_repository.dart';
import 'package:login_module/infra/datasources/icadastro_datasource.dart';

import 'package:fpdart/fpdart.dart';

class CadastroRepositoryImpl implements ICadastroRepository {
  final ICadastroDatasource _datasource;

  CadastroRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, dynamic>> createPaciente(PacienteCadastroFormEntity pacienteCadastroFormEntity) async {
    try {
      final result = await _datasource.createPaciente(pacienteCadastroFormEntity);
      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, dynamic>> createMedico(MedicoCadastroFormEntity medicoCadastroFormEntity) async {
 try {
      final result = await _datasource.createMedico(medicoCadastroFormEntity);
      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }
}

