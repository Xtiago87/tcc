abstract class SendMessageEvent{}

class SendMessageTextEvent extends SendMessageEvent{
  final String text;
  final int id;

  SendMessageTextEvent(this.text, this.id);
}

class SendMessageTextOptionsEvent extends SendMessageEvent{
  final String text;
  final int id;

  SendMessageTextOptionsEvent(this.text, this.id);
}