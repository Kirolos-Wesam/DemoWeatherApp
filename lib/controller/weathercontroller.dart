import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp/model/weathermodel.dart';
import 'package:weatherapp/services/weatherservices.dart';

class WeatherController extends GetxController {
  WeatherModel? weather;
  String degreeType = 'C';
  double currentTemp = 0;
  double maxTemp = 0;
  double minTemp = 0;

  @override
  void onInit() {
    super.onInit();
    getCurrentCity().then((value) {
      WeatherServices()
          .getWeather(
              latitude: value[0].toString(), longitude: value[1].toString())
          .then((value) {
        weather = WeatherModel.fromJson(value.data);
        calculateTempToCelsius();
      });
    }).onError((error, stackTrace) {

    });
  }

  Future<List<double>> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<double> latitudeAndLongitude = [position.latitude, position.longitude];

    return latitudeAndLongitude;
  }

  void calculateTempToCelsius() {
    degreeType = 'C';
    currentTemp = weather!.main!.temp! - 273.15;
    maxTemp = weather!.main!.tempMax! - 273.15;
    minTemp = weather!.main!.tempMin! - 273.15;
    update();
  }

  void calculateTempToFahrenheit() {
    degreeType = 'F';
    currentTemp = 9 / 5 * (weather!.main!.temp! - 273.15) + 32;
    maxTemp = 9 / 5 * (weather!.main!.tempMax! - 273.15) + 32;
    minTemp = 9 / 5 * (weather!.main!.tempMin! - 273.15) + 32;
    update();
  }

  Future<void> refreshPage() async{
    getCurrentCity().then((value) {
      WeatherServices()
          .getWeather(
              latitude: value[0].toString(), longitude: value[1].toString())
          .then((value) {
        weather = WeatherModel.fromJson(value.data);
        calculateTempToCelsius();
      });
    });
    return await Future.delayed(const Duration(seconds: 2));
  }
}
