import 'package:core_module/domain/entities/perfil_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';
import '../repositories/perfil_repository.dart';

class GetPerfilUsecase{
  final IPerfilRepository perfilRepository;

  GetPerfilUsecase(this.perfilRepository);

  Future<Either<Failure, PerfilEntity>> getPerfil() async {
    return await perfilRepository.getPerfil();
  }
}