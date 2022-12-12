import 'package:objectbox/objectbox.dart';

@Entity()
class Perfil{

  @Id()
  int id = 0;

  String? email;
  String? uid;
  String? fullName;
  String? photo;

}