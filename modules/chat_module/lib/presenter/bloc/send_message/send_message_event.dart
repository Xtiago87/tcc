abstract class SendMessageEvent{}

class SendMessageTextEvent extends SendMessageEvent{
  final String text;

  SendMessageTextEvent(this.text);
}

class SendMessageTextOptionsEvent extends SendMessageEvent{
  final String text;

  SendMessageTextOptionsEvent(this.text);
}