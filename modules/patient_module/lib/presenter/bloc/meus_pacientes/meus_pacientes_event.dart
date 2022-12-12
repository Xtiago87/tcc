abstract class MeusPacientesEvent{}

class GetAllMyPacientesEvent extends MeusPacientesEvent{
final int id;

  GetAllMyPacientesEvent(this.id);
}