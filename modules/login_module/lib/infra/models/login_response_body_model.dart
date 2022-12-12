class LoginResponseBodyModel{
  final String email;
  final String uid;
  final int id;
  final String provider;
  final String fullName;
  final String photo;
  final String userType;

  LoginResponseBodyModel(
      { required this.email,
        required this.uid,
        required this.id,
        required this.provider,
        required this.fullName,
        required this.photo,
        required this.userType,});
}