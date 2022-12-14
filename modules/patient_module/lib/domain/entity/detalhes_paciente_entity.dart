class DetalhesPacienteEntity {
  final String dataBirth;
  final int id;
  final String email;
  final String fullName;
  final String diagnostic;
  final List<IllnessEntity> illnessList;
  final List<AlergyEntity> alergyList;
  final List<IllnessEntity> familyIllnesslist;

  DetalhesPacienteEntity(this.dataBirth, this.id, this.email, this.fullName, this.illnessList, this.alergyList, this.familyIllnesslist, this.diagnostic);
}

class IllnessEntity {

  final String date;
  final String name;
  final String symptoms;

  IllnessEntity(this.date, this.name, this.symptoms);
}

class AlergyEntity {

  final String date;
  final String name;

  AlergyEntity(this.date, this.name);


}
