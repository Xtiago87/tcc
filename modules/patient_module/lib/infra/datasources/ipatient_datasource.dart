import 'package:core_module/infra/models/paciente_model.dart';
import 'package:patient_module/infra/mapper/paciente_mapper.dart';

abstract class IPacienteDatasource{
  Future<List<PacienteModel>> getAllMyPatients(int id);
  Future<DetalhesPacienteModel> getPatientDetails(int id, int pacientId);
}