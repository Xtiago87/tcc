import 'package:core_module/domain/error/failure.dart';
import 'package:dio/dio.dart';

class CheckDoencasAlergiasService{


 static Future<bool> checkDoencasEAlergias(int id) async {
    try{
      final Dio dio = Dio();
      final response = await dio.get("https://a2ad-200-253-187-124.sa.ngrok.io/api/v1/pacient/getPacient/$id");
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
