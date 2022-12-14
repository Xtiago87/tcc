class MessageResponseEntity{
  final String text;
  final List<String> buttons;
  final int many;
  final List<String> mensgesns;

  MessageResponseEntity( {required this.text,required this.buttons,required this.many, required this.mensgesns,});
}