import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talabat_quiz/app/view/dbreset_screen.dart';
import 'app/controller/role_selection_controller.dart';
import 'app/controller/waiting_controller.dart';
import 'app/view/game_screen.dart';
import 'app/view/role_selection.dart';
import 'app/view/waiting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(RoleSelectionController());
      }),
      getPages: [
        GetPage(name: '/', page: () => RoleSelectionScreen()),
        GetPage(
            name: '/waiting',
            page: () => WaitingScreen(),
            binding: BindingsBuilder(() {
              Get.put(WaitingController());
            })),
        GetPage(name: '/game', page: () => GameScreen(role: Get.arguments)),
      ],
      home:const RoleSelectionScreen()
      
    );
  }
}