import '../../models/message_model.dart';
import '../../models/message_response_model.dart';
import 'package:core_module/external/remote/base_datasource_remote_impl.dart';

abstract class IMessageDatasourceRemote extends BaseDatasourceRemoteImpl{

  Future<MessageModel> sendTextMessage(String text, int id);
  Future<MessageResponseModel> sendOptionsMessage(String text, int id);

}