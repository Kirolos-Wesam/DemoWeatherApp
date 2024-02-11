import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/weathercontroller.dart';
import 'package:weatherapp/view/detailsscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<WeatherController>(
            builder: (controller) => controller.weather == null
                ? const Text(
                    'Loading...',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${controller.weather!.name}',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.location_on,
                        size: 19,
                        color: Colors.red,
                      )
                    ],
                  )),
        actions: [
          GetBuilder<WeatherController>(
              builder: (controller) => TextButton(
                  onPressed: () {
                    if (controller.degreeType == 'C') {
                      controller.calculateTempToFahrenheit();
                    } else {
                      controller.calculateTempToCelsius();
                    }
                  },
                  child: Text(
                    '°${controller.degreeType}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )))
        ],
      ),
      body: GetBuilder(
          init: WeatherController(),
          builder: (controller) => AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                switchInCurve: Curves.easeIn,
                child: controller.weather == null
                    ? LinearProgressIndicator(
                        color: Colors.blue[900],
                      )
                    : weatherView(controller, context),
              )),
    );
  }

  Widget weatherView(controller, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 12,
            child: RefreshIndicator(
              color: Colors.white,
              backgroundColor: Colors.blue[900],
              onRefresh: () => controller.refreshPage(),
              child: ListView(
                shrinkWrap: false,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Text(
                      "${controller.currentTemp.round()}°${controller.degreeType}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        'https://openweathermap.org/img/wn/${controller.weather!.weather![0].icon}@4x.png',
                    height: 200,
                    width: double.infinity,
                  ),
                  Center(
                      child: Text(
                    '${controller.weather!.weather![0].description}   ${controller.maxTemp.round()}°/${controller.minTemp.round()}°',
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900]),
                    onPressed: () {
                      Get.to(() => DetailsScreen(),
                          transition: Transition.cupertino,
                          duration: const Duration(milliseconds: 600));
                    },
                    child: Row(
                      children: [
                        if (controller.weather != null)
                          Expanded(
                            flex: 3,
                            child: Text(
                              '${controller.weather!.weather![0].main} ${controller.maxTemp.round()}°/${controller.minTemp.round()}°',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        const Expanded(
                            child: Text(
                          'More Details',
                          style: TextStyle(color: Colors.white),
                        )),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
