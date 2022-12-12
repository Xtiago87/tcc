import 'package:core_module/core_module.dart';
import 'package:core_module/domain/entities/medico_entity.dart';

abstract class PerfilState{}

class PerfilInitialState extends PerfilState{}
class PerfilLoadingState extends PerfilState{}
class PerfilSuccessState extends PerfilState{
  final PerfilEntity perfilEntity;
  PerfilSuccessState(this.perfilEntity);
}
class PerfilMedicoFailureState extends PerfilState{
  final String errorMessage;
  PerfilMedicoFailureState(this.errorMessage);
}
