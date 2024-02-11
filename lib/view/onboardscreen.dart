import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weatherapp/view/homescreen.dart';


class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Image.asset('assets/images/splashScreen.jpg')),
            const Expanded(
              flex: 2,
              child: Text('Welcome to the demo Weather App. Here, you will see all the requirements that are included in the email. I hope you will be happy.', style: TextStyle(color: Colors.black, fontSize: 17,), textAlign: TextAlign.center,)),
            Expanded(
              flex: 0,
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
                  onPressed: (){
                    GetStorage box = GetStorage();
                    box.write('onBoard', true).then((value) {
                      Get.off(() => HomeScreen(), transition: Transition.cupertino, duration: const Duration(milliseconds: 600) );
                    });
                  }, child: const Text('Get started', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))),
            )
          ],
        ),
      ),
    );
  }
}