class ChatMessageEntity{
  final String text;
  //0==bot 1==user
  final int userType;

  ChatMessageEntity(this.text, this.userType);
}