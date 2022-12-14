import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';

class CheckDoencasAlergiasService{


 static Future<bool> checkDoencasEAlergias(int id) async {
    try{
      final Dio dio = Dio();
      final response = await dio.get("https://01d2-187-18-138-176.sa.ngrok.io/api/v1/pacient/getPacient/$id");
      if(response.data["total"] == 0){
        return true;
      }else{
        return false;
      }
    } on Failure{
      return false;
    }
  }
}
