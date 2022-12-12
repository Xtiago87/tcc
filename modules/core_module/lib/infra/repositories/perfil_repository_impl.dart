import 'package:core_module/domain/entities/perfil_entity.dart';
import 'package:core_module/domain/error/failure.dart';
import 'package:core_module/domain/repositories/perfil_repository.dart';
import 'package:core_module/infra/datasources/iperfil_datasource.dart';
import 'package:fpdart/src/either.dart';

class PerfilRepositoryImpl extends IPerfilRepository{

  final IPerfilDatasource iPerfilDatasource;

  PerfilRepositoryImpl(this.iPerfilDatasource);

  @override
  Future<Either<Failure, PerfilEntity>> getPerfil() async {
    try{
      final response = await iPerfilDatasource.getPerfil();
      return Right(response);
    } on Failure catch (e){
      return Left(e);
    }
  }

}