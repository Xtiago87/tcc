import 'package:core_module/domain/error/failure.dart';
import 'package:core_module/infra/models/paciente_model.dart';
import 'package:patient_module/infra/datasources/ipatient_datasource.dart';
import 'package:patient_module/infra/datasources/remote/ipatient_datasource_remote_impl.dart';

class PatientDatasourceImpl extends IPacienteDatasource{

  final IPatientDatasourceRemoteImpl iPatientDatasourceRemoteImpl;

  PatientDatasourceImpl(this.iPatientDatasourceRemoteImpl);


  @override
  Future<List<PacienteModel>> getAllMyPatients(int id) async {
    try {
      return await iPatientDatasourceRemoteImpl.getAllMyPatients(id);
    } on Failure {
      rethrow;
    }
  }

  @override
  Future<PacienteModel> getPatientDetails() {
    // TODO: implement getPatientDetails
    throw UnimplementedError();
  }

}