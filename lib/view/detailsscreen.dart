import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/weathercontroller.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  var controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${controller.weather!.name!}, ${controller.weather!.sys!.country} ',
                  style: const TextStyle(fontSize: 18),
                ),
                const Icon(
                  Icons.location_on,
                  size: 19,
                  color: Colors.red,
                )
              ],
            ),
            Text(
              controller.weather!.weather![0].description!,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "${controller.currentTemp.round()}°${controller.degreeType}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              CachedNetworkImage(
                imageUrl:
                    'https://openweathermap.org/img/wn/${controller.weather!.weather![0].icon}@4x.png',
                height: 200,
                width: double.infinity,
              ),
              Text(
                '${controller.weather!.weather![0].main}   ${controller.maxTemp.round()}°/${controller.minTemp.round()}°',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 120,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Colors.blue[900]),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/humidity.png',
                            height: 50,
                            width: 50,
                            color: Colors.white,
                          ),
                          const Expanded(child: Text('Humidity')),
                          Expanded(
                              child: Text(
                                  '${controller.weather!.main!.humidity!} %'))
                        ],
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: 2,
                      color: Colors.white,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Image.asset('assets/images/WindSpeed.png',
                              height: 50, width: 50, color: Colors.white),
                          const Expanded(child: Text('Wind')),
                          Expanded(
                              child: Text(
                                  '${controller.weather!.wind!.speed} M/S'))
                        ],
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: 2,
                      color: Colors.white,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Pressure.png',
                            height: 50,
                            width: 50,
                            color: Colors.white,
                          ),
                          const Expanded(child: Text('pressure')),
                          Expanded(
                              child: Text(
                                  '${controller.weather!.main!.pressure}mbar'))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
