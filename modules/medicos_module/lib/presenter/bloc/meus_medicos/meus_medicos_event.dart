abstract class MeusMedicosEvent{}

class GetMeusMedicosEvent extends MeusMedicosEvent{
  final String id;

  GetMeusMedicosEvent({required this.id});
}