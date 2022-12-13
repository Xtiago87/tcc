abstract class DetalhesPacienteEvent{}

class GetDetalhesPaciente extends DetalhesPacienteEvent{
  final int pacienteId;
  final int userId;

  GetDetalhesPaciente(this.pacienteId, this.userId);

}