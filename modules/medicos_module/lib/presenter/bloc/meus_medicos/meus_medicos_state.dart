import 'package:medicos_module/domain/entities/medic_entity.dart';

abstract class MeusMedicosState{}

class MeusMedicosInitialState extends MeusMedicosState{}

class MeusMedicosSuccessState extends MeusMedicosState{
  final List<MedicEntity> list;

  MeusMedicosSuccessState(this.list);
}

class MeusMedicosFailureState extends MeusMedicosState{
  final String errorMessage;

  MeusMedicosFailureState(this.errorMessage);
}

class MeusMedicosLoadingState extends MeusMedicosState{}