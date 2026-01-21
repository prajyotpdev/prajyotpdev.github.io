import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prajyotpawar/ui/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {

    await Firebase.initializeApp();
  } on FirebaseException catch (e) {
    print("Firebase Error: ${e.code} - ${e.message}");
  } catch (e) {
    print("Generic Error: $e");
  }

  runApp(const MinecraftPortfolio());
}

class MinecraftPortfolio extends StatelessWidget {
  const MinecraftPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Minecraft Portfolio',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   fontFamily: 'VT323', // Minecraft-like font
      //   scaffoldBackgroundColor: const Color(0xFF1a1a2e),
      // ),
      home: PortfolioHome(),
    );
  }
}

