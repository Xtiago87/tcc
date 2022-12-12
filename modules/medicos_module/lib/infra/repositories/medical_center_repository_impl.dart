import 'package:core_module/domain/error/failure.dart';
import 'package:fpdart/src/either.dart';
import 'package:medicos_module/domain/entities/medical_center_entity.dart';
import 'package:medicos_module/domain/repositories/imedical_center_repository.dart';
import 'package:medicos_module/infra/datasource/imedical_center_datasource.dart';

import '../../domain/entities/medic_entity.dart';
import '../model/medic_model.dart';

class MedicalCenterRespositoryImpl extends IMedicalCenterRepository{

  final IMedicalCenterDatasource iMedicalCenterDatasource;

  MedicalCenterRespositoryImpl(this.iMedicalCenterDatasource);


  @override
  Future<Either<Failure, List<MedicModel>>> getMedicalCenterDetail(int id) async {
    try {
      final result = await iMedicalCenterDatasource.getMedicalCenterDetails(id);
      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<MedicalCenterEntity>>> listAllMedicalCenters() async {
    try {
      final result = await iMedicalCenterDatasource.listAllMedicalCenters();
      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, dynamic>> addMedicalCenter(form) async {
    try {
      final result = await iMedicalCenterDatasource.addMedicalCenter(form);
      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }


}