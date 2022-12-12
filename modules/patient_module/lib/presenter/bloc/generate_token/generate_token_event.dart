abstract class GenerateTokenEvent{}

class GetToken extends GenerateTokenEvent{
  final int id;

  GetToken(this.id);
}