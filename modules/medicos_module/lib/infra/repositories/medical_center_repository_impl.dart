import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:medicos_module/domain/entities/medical_center_entity.dart';
import 'package:medicos_module/domain/repositories/imedical_center_repository.dart';
import 'package:medicos_module/infra/datasource/imedical_center_datasource.dart';
import 'package:medicos_module/infra/model/medical_center_form_model.dart';

import '../../domain/entities/medic_entity.dart';
import '../../domain/entities/medical_center_form_entity.dart';
import '../model/medic_model.dart';

class MedicalCenterRespositoryImpl extends IMedicalCenterRepository {
  final IMedicalCenterDatasource iMedicalCenterDatasource;

  MedicalCenterRespositoryImpl(this.iMedicalCenterDatasource);

  @override
  Future<Either<Failure, List<MedicModel>>> getMedicalCenterDetail(
      int id) async {
    try {
      final result = await iMedicalCenterDatasource.getMedicalCenterDetails(id);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<MedicalCenterEntity>>>
      listAllMedicalCenters() async {
    try {
      final result = await iMedicalCenterDatasource.listAllMedicalCenters();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, dynamic>> addMedicalCenter(
      MedicalCenterFormEntity form) async {
    try {
      final result = await iMedicalCenterDatasource.addMedicalCenter(
        MedicalCenterFormModel(
          nome: form.nome,
          endereco: form.endereco,
          planoDeSaude: form.planoDeSaude,
        ),
      );
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
