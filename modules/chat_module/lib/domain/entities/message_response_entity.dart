class MessageResponseEntity{
  final String text;
  final List<String> buttons;
  final int many;

  MessageResponseEntity({required this.text,required this.buttons,required this.many});
}