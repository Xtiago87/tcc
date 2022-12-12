import 'package:core_module/infra/models/objectbox/perfil.dart';
import 'package:core_module/infra/models/perfil_model.dart';

class PerfilMapper {

  static PerfilModel perfilModelFromObjectbox(Perfil perfil) {
    return PerfilModel(
        uid: perfil.uid.toString(),
        photo: "",
        id: perfil.id.toString(),
        fullName: perfil.fullName as String,
        email: perfil.email as String);
  }

  static Perfil perfilModelToObjectbox(PerfilModel perfilModel) {
    Perfil perfil = Perfil();
    perfil.email = perfilModel.email;
    perfil.fullName = perfilModel.fullName;
    perfil.photo = perfilModel.photo;
    perfil.uid = perfilModel.uid;
    return perfil;
  }

}
