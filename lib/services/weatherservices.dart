import 'package:dio/dio.dart';

class WeatherServices{
    final dio = Dio();
  
 Future<Response> getWeather({required String latitude , required String longitude}) async{
    Response response;
    response = await dio.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=46bb9b799056f6b770754df2acae08e3');
    if(response.statusCode == 200){
      return response;
    }
    else{
      return Future.error('Error');
    }
    
  }

}