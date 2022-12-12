class AuthBodyResponseEntity{
  String? accessToken;
  String? client;
  String? expiry;
  String? tokenType;
  String? uid;

  AuthBodyResponseEntity(
      {required this.accessToken,required this.client,required this.expiry,required this.tokenType,required this.uid});


}