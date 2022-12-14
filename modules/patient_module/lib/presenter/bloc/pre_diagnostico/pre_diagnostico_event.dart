abstract class PreDiagnosticoEvent{}

class GetPreDiagnosticoEvent extends PreDiagnosticoEvent{
  final int id;

  GetPreDiagnosticoEvent(this.id);
}